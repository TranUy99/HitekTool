// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseChannel _$BaseChannelFromJson(Map<String, dynamic> json) => BaseChannel(
      id: json['id'] as String,
      name: json['name'] as String?,
      coverUrl: json['cover_url'] as String?,
      lastMessageId: json['last_message_id'] as String?,
      lastMessage: json['last_message'] == null ? null : BaseMessage.fromJson(json['last_message'] as Map<String, dynamic>),
      role: json['role'] as String?,
      isHidden: json['is_hidden'] as bool?,
      isPushEnabled: json['is_push_enabled'] as bool?,
      freeze: json['freeze'] as bool?,
      createdAtUnixTimestamp: json['created_at_unix_timestamp'] as String?,
      updatedAtUnixTimestamp: json['updated_at_unix_timestamp'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      unreadMessagesCount: json['unread_messages_count'] as int? ?? 0,
      memberCount: json['member_count'] as int? ?? 0,
      createdBy: json['created_by'] == null ? null : User.fromJson(json['created_by'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>?)?.map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
      operators: (json['operators'] as List<dynamic>?)?.map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$BaseChannelToJson(BaseChannel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'last_message_id': instance.lastMessageId,
      'last_message': instance.lastMessage,
      'role': instance.role,
      'is_hidden': instance.isHidden,
      'is_push_enabled': instance.isPushEnabled,
      'freeze': instance.freeze,
      'created_at_unix_timestamp': instance.createdAtUnixTimestamp,
      'updated_at_unix_timestamp': instance.updatedAtUnixTimestamp,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'unread_messages_count': instance.unreadMessagesCount,
      'member_count': instance.memberCount,
      'created_by': instance.createdBy,
      'members': instance.members,
      'operators': instance.operators,
    };
