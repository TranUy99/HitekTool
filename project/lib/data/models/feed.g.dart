// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) => Feed(
      id: json['id'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      hash: json['hash'] as String?,
      type: $enumDecodeNullable(_$FeedTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'hash': instance.hash,
      'type': _$FeedTypeEnumMap[instance.type],
    };

const _$FeedTypeEnumMap = {
  FeedType.freezed: 'freezed',
  FeedType.open: 'open',
};
