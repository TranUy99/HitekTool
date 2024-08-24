import 'package:project/data/repositories/message/imessage_repository.dart';
import 'package:project/data/repositories/message/message_repository.dart';
import 'package:project/modules/chat_detail/chat_detail_controller.dart';
import 'package:get/get.dart';

class ChatDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IMessageRepository>(MessageRepository(api: Get.find()));
    Get.create(() => ChatDetailController(messageRepository: Get.find(), socketService: Get.find()));
  }
}
