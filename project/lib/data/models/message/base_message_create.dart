import 'package:project/data/models/message/base_message.dart';

class BaseMessageCreate {
  String? channelId;

  BaseMessageCreate({this.channelId});

  BaseMessageCreate.withMessage(BaseMessage message) {
    channelId = message.channelId!;
  }
}
