// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextMessageCreate _$TextMessageCreateFromJson(Map<String, dynamic> json) =>
    TextMessageCreate(
      message: json['message'] as String?,
      channelId: json['channelId'] as String?,
    );

Map<String, dynamic> _$TextMessageCreateToJson(TextMessageCreate instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'message': instance.message,
    };
