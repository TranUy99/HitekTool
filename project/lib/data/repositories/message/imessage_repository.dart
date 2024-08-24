import 'package:project/data/models/message/base_message.dart';

abstract class IMessageRepository {
  Future<List<BaseMessage>> getNetworkMessageList({required int page, int? limit});

  Future<List<BaseMessage>> getMessagesFromLastMessageId({required String lastMessageId});
}
