import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/services/socket_service/wrapper/listener_wrapper.dart';
import 'package:socket_io_client/socket_io_client.dart';

typedef MessageCallback = Function(BaseMessage message);

class MessageSocketManager {
  final Socket socket;
  final List<ListenerWrapper> _onMessageUpdatedListeners = [];
  final List<ListenerWrapper> _onMessagesDeletedListeners = [];
  final List<ListenerWrapper> _onMessagesAddedListeners = [];

  MessageSocketManager(this.socket) {
    handleMessageSocket();
  }

  void handleMessageSocket() {
    socket.on("add-message", (data) {
      _handleMessageEvent(_onMessagesAddedListeners, data);
    });
    socket.on("update-message", (data) {
      _handleMessageEvent(_onMessageUpdatedListeners, data);
    });
    socket.on("delete-message", (data) {
      _handleMessageEvent(_onMessagesDeletedListeners, data);
    });
  }

  void _handleMessageEvent(List<ListenerWrapper> listeners, dynamic data) {
    if (data == null) return;
    final baseMessage = BaseMessage.fromJson(data);
    _notifyListeners(listeners, baseMessage);
  }

  void _notifyListeners(List<ListenerWrapper> listeners, BaseMessage message) {
    for (var wrapper in listeners) {
      if (wrapper.channelId == null || wrapper.channelId == message.channelId) {
        wrapper.listener(message);
      }
    }
  }

  void onMessageUpdated(MessageCallback listener, {String? channelId}) {
    _onMessageUpdatedListeners.add(ListenerWrapper(listener, channelId));
  }

  void onMessagesDeleted(MessageCallback listener, {String? channelId}) {
    _onMessagesDeletedListeners.add(ListenerWrapper(listener, channelId));
  }

  void onMessagesAdded(MessageCallback listener, {String? channelId}) {
    _onMessagesAddedListeners.add(ListenerWrapper(listener, channelId));
  }

  void messageCallbackHandler(MessageCallback listener, String? channelId, BaseMessage message) {
    if (channelId == null) {
      listener(message);
    } else if (message.channelId == channelId) {
      listener(message);
    }
  }

  void removeOnMessageUpdated(MessageCallback listener) {
    _onMessageUpdatedListeners.remove(listener);
  }

  void removeOnMessagesDeleted(MessageCallback listener) {
    _onMessagesDeletedListeners.remove(listener);
  }

  void removeOnMessagesAdded(MessageCallback listener, {String? channelId}) {
    _onMessagesAddedListeners.removeWhere(
      (wrapper) => wrapper.matches(listener, channelId),
    );
  }

  void clearListeners() {
    _onMessageUpdatedListeners.clear();
    _onMessagesDeletedListeners.clear();
    _onMessagesAddedListeners.clear();
  }
}
