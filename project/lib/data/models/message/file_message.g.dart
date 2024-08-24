// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileMessage _$FileMessageFromJson(Map<String, dynamic> json) => FileMessage(
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => InfoFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      channelId: json['conversation_id'] as String?,
      channel: json['channel'] == null
          ? null
          : BaseChannel.fromJson(json['channel'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
      userId: json['user_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAtUnixTimestamp: json['created_at_unix_timestamp'] as String?,
      updatedAtUnixTimestamp: json['updated_at_unix_timestamp'] as String?,
      isRemoved: json['is_removed'] as bool?,
      sendingStatus:
          $enumDecodeNullable(_$SendingStatusEnumMap, json['sendingStatus']),
    );

Map<String, dynamic> _$FileMessageToJson(FileMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.channelId,
      'user_id': instance.userId,
      'user': instance.user?.toJson(),
      'channel': instance.channel?.toJson(),
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
      'created_at_unix_timestamp': instance.createdAtUnixTimestamp,
      'updated_at_unix_timestamp': instance.updatedAtUnixTimestamp,
      'type': _$MessageTypeEnumMap[instance.type],
      'is_removed': instance.isRemoved,
      'sendingStatus': _$SendingStatusEnumMap[instance.sendingStatus],
      'files': instance.files?.map((e) => e.toJson()).toList(),
    };

const _$MessageTypeEnumMap = {
  MessageType.msg: 'MSG',
  MessageType.file: 'FILE',
};

const _$SendingStatusEnumMap = {
  SendingStatus.pending: 'pending',
  SendingStatus.failed: 'failed',
  SendingStatus.succeeded: 'succeeded',
};
