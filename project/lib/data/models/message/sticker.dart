// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'sticker.g.dart';

@JsonSerializable()
class Sticker {
  String id;
  String? url;
  String? hash;
  @JsonKey(name: 'created_at_unix_timestamp')
  String? createdAtUnixTimestamp;
  @JsonKey(name: 'updated_at_unix_timestamp')
  String? updatedAtUnixTimestamp;

  Sticker({
    required this.id,
    this.url,
    this.hash,
    this.createdAtUnixTimestamp,
    this.updatedAtUnixTimestamp,
  });

  factory Sticker.fromJson(Map<String, dynamic> json) => _$StickerFromJson(json);

  Map<String, dynamic> toJson() => _$StickerToJson(this);

  static Sticker get fakeData {
    final randomImage = Random().nextInt(150) + 1;

    final url = 'https://picsum.photos/id/$randomImage/200/300';
    return Sticker(
      id: const Uuid().v4(),
      hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
      url: url,
    );
  }

  Sticker copyWith({
    String? id,
    String? url,
    String? hash,
    String? createdAtUnixTimestamp,
    String? updatedAtUnixTimestamp,
  }) {
    return Sticker(
      id: id ?? this.id,
      url: url ?? this.url,
      hash: hash ?? this.hash,
      createdAtUnixTimestamp: createdAtUnixTimestamp ?? this.createdAtUnixTimestamp,
      updatedAtUnixTimestamp: updatedAtUnixTimestamp ?? this.updatedAtUnixTimestamp,
    );
  }
}
