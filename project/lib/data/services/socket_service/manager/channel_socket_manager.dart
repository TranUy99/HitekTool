import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:socket_io_client/socket_io_client.dart';

typedef ChannelCallback = Function(BaseChannel channel);

class ChannelSocketManager {
  final Socket socket;
  final List<ChannelCallback> _onChannelUpdatedListeners = [];
  final List<ChannelCallback> _onChannelDeletedListeners = [];

  ChannelSocketManager(this.socket) {
    handleChannelSocket();
  }

  void handleChannelSocket() {
    socket.on("update-channel", (data) {
      _handleChannelEvent(_onChannelUpdatedListeners, data);
    });
    socket.on("delete-channel", (data) {
      _handleChannelEvent(_onChannelDeletedListeners, data);
    });
  }

  void _handleChannelEvent(List<ChannelCallback> listeners, dynamic data) {
    if (data == null) return;
    final baseChannel = BaseChannel.fromJson(data);
    _notifyListeners(listeners, baseChannel);
  }

  void _notifyListeners(List<Function> listeners, dynamic data) {
    for (var listener in listeners) {
      listener(data);
    }
  }

  void onChannelUpdated(ChannelCallback listener) {
    _onChannelUpdatedListeners.add(listener);
  }

  void onChannelDeleted(ChannelCallback listener) {
    _onChannelDeletedListeners.add(listener);
  }

  void removeOnChannelUpdated(ChannelCallback listener) {
    _onChannelUpdatedListeners.remove(listener);
  }

  void removeOnChannelDeleted(ChannelCallback listener) {
    _onChannelDeletedListeners.remove(listener);
  }

  void clearListeners() {
    _onChannelUpdatedListeners.clear();
    _onChannelDeletedListeners.clear();
  }
}
