// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'base_channel.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseChannel {
  String id;
  String? name;
  @JsonKey(name: 'cover_url')
  String? coverUrl;
  @JsonKey(name: 'last_message_id')
  String? lastMessageId;
  @JsonKey(name: 'last_message')
  BaseMessage? lastMessage;
  String? role; // OWNER || ADMIN
  @JsonKey(name: 'is_hidden')
  bool? isHidden;
  @JsonKey(name: 'is_push_enabled')
  bool? isPushEnabled;
  bool? freeze;
  @JsonKey(name: 'created_at_unix_timestamp')
  String? createdAtUnixTimestamp;
  @JsonKey(name: 'updated_at_unix_timestamp')
  String? updatedAtUnixTimestamp;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'unread_messages_count', defaultValue: 0)
  int? unreadMessagesCount;
  @JsonKey(name: 'member_count', defaultValue: 0)
  int? memberCount;
  @JsonKey(name: 'created_by')
  User? createdBy;
  List<User>? members;
  List<User>? operators;

  BaseChannel({
    required this.id,
    this.name,
    this.coverUrl,
    this.lastMessageId,
    this.lastMessage,
    this.role,
    this.isHidden,
    this.isPushEnabled,
    this.freeze,
    this.createdAtUnixTimestamp,
    this.updatedAtUnixTimestamp,
    this.createdAt,
    this.updatedAt,
    this.unreadMessagesCount,
    this.memberCount,
    this.createdBy,
    this.members,
    this.operators,
  });

  factory BaseChannel.fromJson(Map<String, dynamic> json) => _$BaseChannelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseChannelToJson(this);

  static BaseChannel get fakeData {
    var randomId = Random().nextInt(50) + 100;
    return BaseChannel(
      id: const Uuid().v4(),
      lastMessage: BaseMessage.fakeData,
      createdAtUnixTimestamp: DateTime.now().subtract(const Duration(days: 5)).millisecondsSinceEpoch.toString(),
      updatedAtUnixTimestamp: DateTime.now().subtract(const Duration(days: 2)).millisecondsSinceEpoch.toString(),
      members: [
        User(
          id: const Uuid().v4(),
          name: 'User $randomId',
          thumbnail: 'https://picsum.photos/id/$randomId/200/300',
          hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
        ),
        User(
          id: const Uuid().v4(),
          name: 'User $randomId',
          thumbnail: 'https://picsum.photos/id/$randomId/200/300',
          hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
        ),
      ],
      unreadMessagesCount: Random().nextInt(3),
    );
  }

  BaseChannel copyWith({
    String? id,
    String? name,
    String? coverUrl,
    String? lastMessageId,
    BaseMessage? lastMessage,
    String? role,
    bool? isHidden,
    bool? isPushEnabled,
    bool? freeze,
    String? createdAtUnixTimestamp,
    String? updatedAtUnixTimestamp,
    String? createdAt,
    String? updatedAt,
    int? unreadMessagesCount,
    int? memberCount,
    User? createdBy,
    List<User>? members,
    List<User>? operators,
  }) {
    return BaseChannel(
      id: id ?? this.id,
      name: name ?? this.name,
      coverUrl: coverUrl ?? this.coverUrl,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      lastMessage: lastMessage ?? this.lastMessage,
      role: role ?? this.role,
      isHidden: isHidden ?? this.isHidden,
      isPushEnabled: isPushEnabled ?? this.isPushEnabled,
      freeze: freeze ?? this.freeze,
      createdAtUnixTimestamp: createdAtUnixTimestamp ?? this.createdAtUnixTimestamp,
      updatedAtUnixTimestamp: updatedAtUnixTimestamp ?? this.updatedAtUnixTimestamp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
      memberCount: memberCount ?? this.memberCount,
      createdBy: createdBy ?? this.createdBy,
      members: members ?? this.members,
      operators: operators ?? this.operators,
    );
  }
}
