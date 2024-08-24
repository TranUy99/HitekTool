// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseMessage _$BaseMessageFromJson(Map<String, dynamic> json) => BaseMessage(
      id: json['id'] as String?,
      channelId: json['conversation_id'] as String?,
      userId: json['user_id'] as String?,
      user: json['user'] == null ? null : User.fromJson(json['user'] as Map<String, dynamic>),
      channel: json['channel'] == null ? null : BaseChannel.fromJson(json['channel'] as Map<String, dynamic>),
      reactions: (json['reactions'] as List<dynamic>?)?.map((e) => Reaction.fromJson(e as Map<String, dynamic>)).toList(),
      createdAtUnixTimestamp: json['created_at_unix_timestamp'] as String?,
      updatedAtUnixTimestamp: json['updated_at_unix_timestamp'] as String?,
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
      isRemoved: json['is_removed'] as bool?,
      sendingStatus: $enumDecodeNullable(_$SendingStatusEnumMap, json['sendingStatus']),
    );

const _$MessageTypeEnumMap = {
  MessageType.msg: 'MSG',
  MessageType.file: 'FILE',
};

const _$SendingStatusEnumMap = {
  SendingStatus.pending: 'pending',
  SendingStatus.failed: 'failed',
  SendingStatus.succeeded: 'succeeded',
};
