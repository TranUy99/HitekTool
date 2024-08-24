// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      avatar: json['avatar'] as String?,
      thumbnail: json['thumbnail'] as String?,
      hash: json['hash'] as String?,
      name: json['name'] as String?,
      isActive: json['is_active'] as bool?,
      isOnline: json['is_online'] as bool?,
      isBlockedByMe: json['is_blocked_by_me'] as bool?,
      isBlockingMe: json['is_blocking_me'] as bool?,
      lastSeenAt: json['last_seen_at'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'thumbnail': instance.thumbnail,
      'hash': instance.hash,
      'name': instance.name,
      'is_active': instance.isActive,
      'is_online': instance.isOnline,
      'is_blocked_by_me': instance.isBlockedByMe,
      'is_blocking_me': instance.isBlockingMe,
      'last_seen_at': instance.lastSeenAt,
    };
