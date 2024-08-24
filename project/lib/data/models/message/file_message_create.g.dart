// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_message_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileMessageCreate _$FileMessageCreateFromJson(Map<String, dynamic> json) =>
    FileMessageCreate(
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => InfoFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelId: json['channelId'] as String?,
    );

Map<String, dynamic> _$FileMessageCreateToJson(FileMessageCreate instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'files': instance.files,
    };
