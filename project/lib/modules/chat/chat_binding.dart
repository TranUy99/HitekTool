import 'package:project/data/repositories/channel/channel_repository.dart';
import 'package:project/data/repositories/channel/ichannel_repository.dart';
import 'package:project/modules/chat/chat_controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IChannelRepository>(ChannelRepository(api: Get.find()));
    Get.create(() => ChatController(channelRepository: Get.find(), socketService: Get.find()));
  }
}
