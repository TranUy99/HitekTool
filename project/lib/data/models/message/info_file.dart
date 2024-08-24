// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'info_file.g.dart';

@JsonSerializable()
class InfoFile {
  String? id;
  String? url;
  String? name;
  double? width;
  double? height;
  double? widthThumbnail;
  double? heightThumbnail;
  String? thumbnail;
  String? type;
  String? hash;

  InfoFile({
    this.id,
    this.url,
    this.name,
    this.width,
    this.height,
    this.widthThumbnail,
    this.heightThumbnail,
    this.thumbnail,
    this.type,
    this.hash,
  });

  factory InfoFile.fromJson(Map<String, dynamic> json) => _$InfoFileFromJson(json);

  Map<String, dynamic> toJson() => _$InfoFileToJson(this);

  InfoFile copyWith({
    String? id,
    String? url,
    String? name,
    double? width,
    double? height,
    double? widthThumbnail,
    double? heightThumbnail,
    String? thumbnail,
    String? type,
    String? hash,
  }) {
    return InfoFile(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      width: width ?? this.width,
      height: height ?? this.height,
      widthThumbnail: widthThumbnail ?? this.widthThumbnail,
      heightThumbnail: heightThumbnail ?? this.heightThumbnail,
      thumbnail: thumbnail ?? this.thumbnail,
      type: type ?? this.type,
      hash: hash ?? this.hash,
    );
  }
}
