import 'package:project/common/config/app_config.dart';
import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/services/local_service.dart';
import 'package:project/data/services/socket_service/manager/channel_socket_manager.dart';
import 'package:project/data/services/socket_service/manager/message_socket_manager.dart';
import 'package:project/data/services/socket_service/manager/socket_manager.dart';
import 'package:get/get.dart';

typedef MessageCallback = Function(BaseMessage message);
typedef ChannelCallback = Function(BaseChannel message);

class SocketService extends GetxService {
  final LocalService localService;
  final AppConfig appConfig;

  SocketService({required this.localService, required this.appConfig});

  late SocketManager socketManager;
  late MessageSocketManager messageSocketManager;
  late ChannelSocketManager channelSocketManager;

  @override
  void onInit() {
    socketManager = SocketManager(localService: localService, appConfig: appConfig);
    messageSocketManager = MessageSocketManager(socketManager.socket!);
    channelSocketManager = ChannelSocketManager(socketManager.socket!);

    super.onInit();
  }

  @override
  void onClose() {
    messageSocketManager.clearListeners();
    channelSocketManager.clearListeners();
    socketManager.clearSocketIO();
    super.onClose();
  }
}
