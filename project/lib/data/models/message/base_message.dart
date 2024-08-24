// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:project/common/config/app_enum.dart';
import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:project/data/models/message/file_message.dart';
import 'package:project/data/models/message/reaction.dart';
import 'package:project/data/models/message/text_message.dart';
import 'package:project/data/models/user.dart';

part 'base_message.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseMessage {
  String? id;
  @JsonKey(name: 'conversation_id')
  String? channelId;
  @JsonKey(name: 'user_id')
  String? userId;
  User? user;
  BaseChannel? channel;
  List<Reaction>? reactions;
  @JsonKey(name: 'created_at_unix_timestamp')
  String? createdAtUnixTimestamp;
  @JsonKey(name: 'updated_at_unix_timestamp')
  String? updatedAtUnixTimestamp;
  MessageType? type;
  @JsonKey(name: 'is_removed')
  bool? isRemoved;
  SendingStatus? sendingStatus;

  BaseMessage({
    required this.id,
    required this.channelId,
    required this.userId,
    required this.user,
    required this.channel,
    required this.reactions,
    required this.createdAtUnixTimestamp,
    required this.updatedAtUnixTimestamp,
    required this.type,
    required this.isRemoved,
    required this.sendingStatus,
  });

  bool get isMyMessage => userId == '1';

  bool get isPending => sendingStatus == SendingStatus.pending;
  bool get isSucceeded => sendingStatus == SendingStatus.succeeded;
  bool get isFailed => sendingStatus == SendingStatus.failed;

  static BaseMessage get fakeData => BaseMessage.fromJson(Random().nextBool() ? TextMessage.fakeData.toJson() : FileMessage.fakeData.toJson());

  factory BaseMessage.fromJson(Map<String, dynamic> json) {
    final baseMessage = _$BaseMessageFromJson(json);
    if (baseMessage.type == MessageType.msg) return TextMessage.fromJson(json);
    return FileMessage.fromJson(json);
  }

  BaseMessage copyWith({
    String? id,
    String? channelId,
    String? userId,
    User? user,
    BaseChannel? channel,
    List<Reaction>? reactions,
    String? createdAtUnixTimestamp,
    String? updatedAtUnixTimestamp,
    MessageType? type,
    bool? isRemoved,
    SendingStatus? sendingStatus,
  }) {
    return BaseMessage(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      channel: channel ?? this.channel,
      reactions: reactions ?? this.reactions,
      createdAtUnixTimestamp: createdAtUnixTimestamp ?? this.createdAtUnixTimestamp,
      updatedAtUnixTimestamp: updatedAtUnixTimestamp ?? this.updatedAtUnixTimestamp,
      type: type ?? this.type,
      isRemoved: isRemoved ?? this.isRemoved,
      sendingStatus: sendingStatus ?? this.sendingStatus,
    );
  }
}

const MessageTypeEnumMap = {
  MessageType.msg: 'MSG',
  MessageType.file: 'FILE',
};
