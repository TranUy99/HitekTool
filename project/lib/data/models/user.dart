// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? avatar;
  String? thumbnail;
  String? hash;
  String? name;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'is_online')
  bool? isOnline;
  @JsonKey(name: 'is_blocked_by_me')
  bool? isBlockedByMe;
  @JsonKey(name: 'is_blocking_me')
  bool? isBlockingMe;
  @JsonKey(name: 'last_seen_at')
  String? lastSeenAt;

  User({
    this.id,
    this.avatar,
    this.thumbnail,
    this.hash,
    this.name,
    this.isActive,
    this.isOnline,
    this.isBlockedByMe,
    this.isBlockingMe,
    this.lastSeenAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? avatar,
    String? thumbnail,
    String? hash,
    String? name,
    bool? isActive,
    bool? isOnline,
    bool? isBlockedByMe,
    bool? isBlockingMe,
    String? lastSeenAt,
  }) {
    return User(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      thumbnail: thumbnail ?? this.thumbnail,
      hash: hash ?? this.hash,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      isOnline: isOnline ?? this.isOnline,
      isBlockedByMe: isBlockedByMe ?? this.isBlockedByMe,
      isBlockingMe: isBlockingMe ?? this.isBlockingMe,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
    );
  }
}
