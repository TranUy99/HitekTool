import 'package:project/data/models/message/base_message_create.dart';
import 'package:project/data/models/message/text_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text_message_create.g.dart';

@JsonSerializable()
class TextMessageCreate extends BaseMessageCreate {
  String? message;
  TextMessageCreate({
    this.message,
    super.channelId,
  });

  factory TextMessageCreate.fromJson(Map<String, dynamic> json) => _$TextMessageCreateFromJson(json);

  Map<String, dynamic> toJson() => _$TextMessageCreateToJson(this);

  TextMessageCreate.withMessage(TextMessage super.userMessage)
      : message = userMessage.message,
        super.withMessage();
}
