// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoFile _$InfoFileFromJson(Map<String, dynamic> json) => InfoFile(
      id: json['id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      widthThumbnail: (json['widthThumbnail'] as num?)?.toDouble(),
      heightThumbnail: (json['heightThumbnail'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
      type: json['type'] as String?,
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$InfoFileToJson(InfoFile instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'widthThumbnail': instance.widthThumbnail,
      'heightThumbnail': instance.heightThumbnail,
      'thumbnail': instance.thumbnail,
      'type': instance.type,
      'hash': instance.hash,
    };
