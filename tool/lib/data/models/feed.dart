// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:tool/common/config/app_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  String? id;
  String? image;
  String? title;
  String? description;
  String? hash;
  FeedType? type;

  Feed({
    this.id,
    this.image,
    this.title,
    this.description,
    this.hash,
    this.type,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);

  static Feed get fakeFeed {
    var randomId = Random().nextInt(50) + 100;
    return Feed.fromJson({
      "id": randomId.toString(),
      "image": 'https://picsum.photos/id/$randomId/200/300',
      "title": "Title",
      "description": "Description",
      "hash": "LEHV6nWB2yk8pyo0adR*.7kCMdnj", // key này lấy từ server,
      "type": FeedType.freezed.name,
    });
  }

  bool get isHavingImage => image != null && image!.isNotEmpty;

  Feed copyWith({
    String? id,
    String? image,
    String? title,
    String? description,
    String? hash,
    FeedType? type,
  }) {
    return Feed(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      hash: hash ?? this.hash,
      type: type ?? this.type,
    );
  }
}
