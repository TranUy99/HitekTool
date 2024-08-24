import 'package:json_annotation/json_annotation.dart';

enum FeedType {
  @JsonValue('freezed')
  freezed,
  @JsonValue('open')
  open,
}

enum SendingStatus {
  pending,
  failed,
  succeeded,
}

enum MessageType {
  @JsonValue('MSG')
  msg,
  @JsonValue('FILE')
  file,
}

enum ReactionType {
  smile,
  sad,
  heart,
}

enum StickerKey {
  smile,
  sad,
  heart,
}
