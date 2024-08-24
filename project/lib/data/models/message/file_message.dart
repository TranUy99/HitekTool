// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:project/common/config/app_enum.dart';
import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/models/message/info_file.dart';
import 'package:project/data/models/message/reaction.dart';
import 'package:project/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'file_message.g.dart';

/// Object representing a user message.
@JsonSerializable(explicitToJson: true)
class FileMessage extends BaseMessage {
  List<InfoFile>? files;
  FileMessage({
    this.files,
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

  factory FileMessage.fromJson(Map<String, dynamic> json) => _$FileMessageFromJson(json);

  Map<String, dynamic> toJson() => _$FileMessageToJson(this);

  static FileMessage get fakeData {
    var randomId = Random().nextInt(50) + 100;
    var userId = randomId % 2 == 0 ? '1' : const Uuid().v4();
    var randomSubtractDays = Random().nextInt(10);
    var randomSubtractHours = Random().nextInt(24);
    var randomSubtractMins = Random().nextInt(59);

    return FileMessage(
      id: const Uuid().v4(),
      createdAtUnixTimestamp: DateTime.now()
          .subtract(Duration(days: randomSubtractDays, hours: randomSubtractHours, minutes: randomSubtractMins))
          .millisecondsSinceEpoch
          .toString(),
      type: MessageType.file,
      userId: userId,
      user: User(
        id: userId, // '1' is my id
        name: 'Jisso',
        thumbnail: 'https://picsum.photos/id/$randomId/200/300',
        hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
      ),
      files: randomId % 3 == 0
          ? [
              InfoFile(
                id: const Uuid().v4(),
                thumbnail: 'https://picsum.photos/id/50/300/200',
                url: 'https://picsum.photos/id/50/4608/3072',
                hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
                type: 'image/png',
                width: 4608,
                height: 3072,
                widthThumbnail: 300,
                heightThumbnail: 200,
              ),
            ]
          : [
              InfoFile(
                id: const Uuid().v4(),
                thumbnail: 'https://picsum.photos/id/100/300/200',
                url: 'https://picsum.photos/id/100/2500/1656',
                hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
                type: 'image/png',
                width: 2500,
                height: 1656,
                widthThumbnail: 300,
                heightThumbnail: 200,
              ),
              InfoFile(
                id: const Uuid().v4(),
                thumbnail: 'https://picsum.photos/id/200/300/200',
                url: 'https://picsum.photos/id/200/1920/1280',
                hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
                type: 'image/png',
                width: 1920,
                height: 1280,
                widthThumbnail: 300,
                heightThumbnail: 200,
              ),
              InfoFile(
                id: const Uuid().v4(),
                thumbnail: 'https://picsum.photos/id/200/200/300',
                url: 'https://picsum.photos/id/200/1920/1280',
                hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
                type: 'image/png',
                width: 1920,
                height: 1280,
                widthThumbnail: 300,
                heightThumbnail: 200,
              ),
              InfoFile(
                id: const Uuid().v4(),
                thumbnail: 'https://picsum.photos/id/100/200/300',
                url: 'https://picsum.photos/id/100/2500/1656',
                hash: "LEHV6nWB2yk8pyo0adR*.7kCMdnj",
                type: 'image/png',
                width: 2500,
                height: 1656,
                widthThumbnail: 300,
                heightThumbnail: 200,
              ),
            ],
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
  FileMessage copyWith({
    String? id,
    String? channelId,
    String? userId,
    List<InfoFile>? files,
    User? user,
    BaseChannel? channel,
    List<Reaction>? reactions,
    String? createdAtUnixTimestamp,
    String? updatedAtUnixTimestamp,
    MessageType? type,
    bool? isRemoved,
    SendingStatus? sendingStatus,
  }) {
    return FileMessage(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      userId: userId ?? this.userId,
      files: files ?? this.files,
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
