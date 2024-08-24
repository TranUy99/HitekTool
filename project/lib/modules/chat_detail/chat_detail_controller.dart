import 'package:project/common/config/app_enum.dart';
import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/repositories/message/imessage_repository.dart';
import 'package:project/data/services/socket_service/manager/message_socket_manager.dart';
import 'package:project/data/services/socket_service/socket_service.dart';
import 'package:project/modules/chat_detail/chat_detail_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailController extends GetxController {
  ChatDetailController({
    required this.messageRepository,
    required this.socketService,
  });
  final IMessageRepository messageRepository;
  final SocketService socketService;
  late MessageSocketManager messageSocketManager;

  final TextEditingController textInputController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  var isOutOfData = false.obs;
  var page = 2;
  var limit = 20;

  var isShowSticker = false.obs;

  late BaseChannel channel;
  Rx<List<BaseMessage>?> messages = Rx(null);

  Future onRefresh() async {
    messages.value = null;
    messages.value = await messageRepository.getNetworkMessageList(page: 1, limit: 1);
    if (messages.value!.length < limit) {
      isOutOfData.value = true;
    } else {
      isOutOfData.value = false;
      page = 2;
    }

    return Future;
  }

  Future<bool> onLoadMore() async {
    var list = await messageRepository.getNetworkMessageList(page: page);
    messages.update((val) {
      val?.addAll(list);
    });
    if (list.length < limit) {
      isOutOfData.value = true;
    } else {
      page++;
    }

    return true;
  }

  switchShowSticker() {
    isShowSticker.toggle();
  }

  onTap() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!isShowSticker.value) return;
    isShowSticker.value = false;
  }

  onAddMessage(BaseMessage message) async {
    messages.update((val) {
      if (val == null) return;
      val.insert(0, message.copyWith(sendingStatus: SendingStatus.pending));
    });
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
    );
    await Future.delayed(const Duration(seconds: 1)); // call api send message
    messages.update((val) {
      if (val == null) return;
      var index = val.indexWhere((element) => message.id == element.id);
      // val[index] = newMessage
      val[index] = val[index].copyWith(sendingStatus: SendingStatus.succeeded);
    });
  }

  handleAddDetailMessage(BaseMessage baseMessage) {
    messages.update((val) {
      val?.insert(0, baseMessage);
    });
  }

  handleSocket() {
    messageSocketManager.onMessagesAdded(channelId: channel.id, handleAddDetailMessage);
    messageSocketManager.onMessageUpdated(channelId: channel.id, (message) => null);
    messageSocketManager.onMessagesDeleted(channelId: channel.id, (message) => null);
  }

  clearSocket() {
    messageSocketManager.removeOnMessagesAdded(channelId: channel.id, handleAddDetailMessage);
  }

  @override
  void onInit() {
    final arguments = Get.arguments as ChatDetailParams;
    channel = arguments.channel;
    messageSocketManager = socketService.messageSocketManager;
    onRefresh();
    handleSocket();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    clearSocket();
    super.onClose();
  }
}
