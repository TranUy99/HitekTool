import 'package:project/common/config/app_constants.dart';
import 'package:project/data/common/base_service.dart';
import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/repositories/message/imessage_repository.dart';

class MessageRepository extends IMessageRepository {
  MessageRepository({
    required BaseService api,
  }) : _api = api;
  final BaseService _api;

  @override
  Future<List<BaseMessage>> getNetworkMessageList({required int page, int? limit}) async {
    limit = limit ?? LIMIT;

    await Future.delayed(const Duration(seconds: 1));

    return List.generate(page == 5 ? limit - 1 : limit, (index) {
      return BaseMessage.fakeData;
    });
  }

  @override
  Future<List<BaseMessage>> getMessagesFromLastMessageId({required String lastMessageId}) async {
    await Future.delayed(const Duration(seconds: 1));

    return List.generate(LIMIT, (index) {
      return BaseMessage.fakeData;
    });
  }
}
