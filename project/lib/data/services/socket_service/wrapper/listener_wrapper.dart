import 'package:project/data/services/socket_service/socket_service.dart';

class ListenerWrapper {
  final MessageCallback listener;
  final String? channelId;

  ListenerWrapper(this.listener, this.channelId);

  bool matches(MessageCallback otherListener, String? otherChannelId) {
    return listener == otherListener && channelId == otherChannelId;
  }
}
