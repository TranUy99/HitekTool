import 'package:json_annotation/json_annotation.dart';

enum FeedType {
  @JsonValue('freezed')
  freezed,
  @JsonValue('open')
  open,
}
