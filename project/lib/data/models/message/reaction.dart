// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:project/common/config/app_enum.dart';
import 'package:project/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reaction.g.dart';

@JsonSerializable(explicitToJson: true)
class Reaction {
  String? id;
  @JsonKey(name: 'message_id')
  String? messageId;
  ReactionType? reaction; // REACTION
  @JsonKey(name: 'user_id')
  String? userId;
  User? user;
  @JsonKey(name: 'created_at_unix_timestamp')
  String? createdAtUnixTimestamp;
  @JsonKey(name: 'updated_at_unix_timestamp')
  String? updatedAtUnixTimestamp;

  Reaction({
    this.id,
    this.messageId,
    this.reaction,
    this.userId,
    this.user,
    this.createdAtUnixTimestamp,
    this.updatedAtUnixTimestamp,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) => _$ReactionFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionToJson(this);

  Reaction copyWith({
    String? id,
    String? messageId,
    ReactionType? reaction,
    String? userId,
    User? user,
    String? createdAtUnixTimestamp,
    String? updatedAtUnixTimestamp,
  }) {
    return Reaction(
      id: id ?? this.id,
      messageId: messageId ?? this.messageId,
      reaction: reaction ?? this.reaction,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      createdAtUnixTimestamp: createdAtUnixTimestamp ?? this.createdAtUnixTimestamp,
      updatedAtUnixTimestamp: updatedAtUnixTimestamp ?? this.updatedAtUnixTimestamp,
    );
  }
}
