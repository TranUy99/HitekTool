// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:project/common/config/app_enum.dart';
import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/models/message/reaction.dart';
import 'package:project/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'text_message.g.dart';

/// Object representing a user message.
@JsonSerializable(explicitToJson: true)
class TextMessage extends BaseMessage {
  String? message;
  TextMessage({
    this.message,
    super.id,
    super.channelId,
    super.channel,
    super.type,
    super.userId,
    super.user,
    super.reactions,
    super.createdAtUnixTimestamp,
    super.updatedAtUnixTimestamp,
    super.isRemoved,
    super.sendingStatus,
  });
  factory TextMessage.fromJson(Map<String, dynamic> json) => _$TextMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TextMessageToJson(this);

  static TextMessage get fakeData {
    var randomId = Random().nextInt(50) + 100;
    var userId = randomId % 2 == 0 ? '1' : const Uuid().v4();
    var randomSubtractDays = Random().nextInt(10);
    var randomSubtractHours = Random().nextInt(24);
    var randomSubtractMins = Random().nextInt(59);

    return TextMessage(
      id: const Uuid().v4(),
      message: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      createdAtUnixTimestamp: DateTime.now()
          .subtract(Duration(days: randomSubtractDays, hours: randomSubtractHours, minutes: randomSubtractMins))
          .millisecondsSinceEpoch
          .toString(),
      type: MessageType.msg,
      userId: userId,
      user: User(
        id: userId, // '1' is my id
        name: 'Jisso',
        thumbnail: 'https://picsum.photos/id/$randomId/200/300',
        hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
      ),
      reactions: List.generate(
        Random().nextInt(10),
        (index) => Reaction(
          id: const Uuid().v4(),
          user: User(
            id: const Uuid().v4(),
            name: 'User $index',
            thumbnail: 'https://picsum.photos/id/$randomId/200/300',
            hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
          ),
          reaction: index % 3 == 0
              ? ReactionType.smile
              : index % 3 == 1
                  ? ReactionType.sad
                  : ReactionType.heart,
        ),
      ),
    );
  }

  @override
  TextMessage copyWith({
    String? id,
    String? channelId,
    String? userId,
    User? user,
    String? message,
    BaseChannel? channel,
    List<Reaction>? reactions,
    String? createdAtUnixTimestamp,
    String? updatedAtUnixTimestamp,
    MessageType? type,
    bool? isRemoved,
    SendingStatus? sendingStatus,
  }) {
    return TextMessage(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      user: user ?? this.user,
      channel: channel ?? this.channel,
      reactions: reactions ?? this.reactions,
      createdAtUnixTimestamp: createdAtUnixTimestamp ?? this.createdAtUnixTimestamp,
      type: type ?? this.type,
      isRemoved: isRemoved ?? this.isRemoved,
      sendingStatus: sendingStatus ?? this.sendingStatus,
    );
  }
}
