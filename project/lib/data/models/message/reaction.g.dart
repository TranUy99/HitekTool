// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reaction _$ReactionFromJson(Map<String, dynamic> json) => Reaction(
      id: json['id'] as String?,
      messageId: json['message_id'] as String?,
      reaction: $enumDecodeNullable(_$ReactionTypeEnumMap, json['reaction']),
      userId: json['user_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAtUnixTimestamp: json['created_at_unix_timestamp'] as String?,
      updatedAtUnixTimestamp: json['updated_at_unix_timestamp'] as String?,
    );

Map<String, dynamic> _$ReactionToJson(Reaction instance) => <String, dynamic>{
      'id': instance.id,
      'message_id': instance.messageId,
      'reaction': _$ReactionTypeEnumMap[instance.reaction],
      'user_id': instance.userId,
      'user': instance.user?.toJson(),
      'created_at_unix_timestamp': instance.createdAtUnixTimestamp,
      'updated_at_unix_timestamp': instance.updatedAtUnixTimestamp,
    };

const _$ReactionTypeEnumMap = {
  ReactionType.smile: 'smile',
  ReactionType.sad: 'sad',
  ReactionType.heart: 'heart',
};
