import 'package:project/common/config/app_constants.dart';
import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/repositories/channel/ichannel_repository.dart';
import 'package:project/data/services/socket_service/manager/channel_socket_manager.dart';
import 'package:project/data/services/socket_service/manager/message_socket_manager.dart';
import 'package:project/data/services/socket_service/socket_service.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController({
    required this.channelRepository,
    required this.socketService,
  });
  final IChannelRepository channelRepository;
  final SocketService socketService;
  late MessageSocketManager messageSocketManager;
  late ChannelSocketManager channelSocketManager;

  var isOutOfData = false.obs;
  var page = 2;
  var limit = LIMIT;

  Rx<List<BaseChannel>?> channels = Rx(null);

  Future onRefresh() async {
    channels.value = null;
    channels.value = await channelRepository.getNetworkChannelList(page: 1, limit: limit);
    if (channels.value!.length < limit) {
      isOutOfData.value = true;
    } else {
      isOutOfData.value = false;
      page = 2;
    }

    return Future;
  }

  Future<bool> onLoadMore() async {
    var list = await channelRepository.getNetworkChannelList(page: page, limit: limit);
    channels.update((val) {
      val?.addAll(list);
    });
    if (list.length < limit) {
      isOutOfData.value = true;
    } else {
      page++;
    }

    return true;
  }

  handleAddChannelMessage(BaseMessage baseMessage) {
    channels.update((val) {
      final indexChannel = val?.indexWhere((channel) => channel.id == baseMessage.channelId);
      if (indexChannel == null || indexChannel == -1) return;
      final updateChannel = val![indexChannel];

      updateChannel.lastMessage = baseMessage;

      val.removeAt(indexChannel);
      val.insert(0, updateChannel);
    });
  }

  void handleChannelSocket() {
    channelSocketManager.onChannelUpdated((channel) => null);
    channelSocketManager.onChannelDeleted((channel) => null);
  }

  void handleMessageSocket() {
    messageSocketManager.onMessagesAdded(_onMessagesAdded);
    messageSocketManager.onMessageUpdated((message) => null);
    messageSocketManager.onMessagesDeleted((message) => null);
  }

  void _onMessagesAdded(BaseMessage newMessage) {
    final updatedChannelIndex = channels.value?.indexWhere((channel) => channel.id == newMessage.channelId);
    if (updatedChannelIndex == null || updatedChannelIndex == -1) {
      // reload chat list page
      return;
    }
    channels.update((val) {
      final swapChannel = val![updatedChannelIndex];
      swapChannel.lastMessage = newMessage;
      val.removeAt(updatedChannelIndex);
      val.insert(0, swapChannel);
    });
  }

  void clearSocket() {
    messageSocketManager.removeOnMessagesAdded(_onMessagesAdded);
    messageSocketManager.removeOnMessageUpdated((message) => null);
    messageSocketManager.removeOnMessagesDeleted((message) => null);

    channelSocketManager.removeOnChannelUpdated((channel) => null);
    channelSocketManager.removeOnChannelDeleted((channel) => null);
  }

  @override
  void onInit() {
    messageSocketManager = socketService.messageSocketManager;
    channelSocketManager = socketService.channelSocketManager;
    onRefresh();
    handleChannelSocket();
    handleMessageSocket();
    super.onInit();
  }

  @override
  void onClose() {
    clearSocket();
    super.onClose();
  }
}
