import 'package:project/common/config/app_config.dart';
import 'package:project/data/services/local_service.dart';
import 'package:project/utils/log.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager extends GetxService {
  final LocalService localService;
  final AppConfig appConfig;
  IO.Socket? socket;

  SocketManager({required this.localService, required this.appConfig});

  @override
  void onInit() {
    initSocketIO();
    super.onInit();
  }

  @override
  void onClose() {
    clearSocketIO();
    super.onClose();
  }

  void initSocketIO() {
    if (socket != null) throw "Socket is initialized";
    if (localService.token == null) throw "Token is null";
    socket = IO.io(
        'http://localhost:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setExtraHeaders({"Authorization": localService.token!})
            .enableForceNew()
            .enableForceNewConnection()
            .enableReconnection()
            .disableAutoConnect()
            .build());

    socket?.connect();

    monitorSocketStatus();
    handleErrorSocket();
  }

  void monitorSocketStatus() {
    socket?.onConnect((data) => logSuccess("socket onConnect"));
    socket?.onConnecting((data) => logInfo("socket onConnecting $data"));
    socket?.onDisconnect((data) => logError("socket onDisconnect $data"));
  }

  void handleErrorSocket() {
    socket?.onConnectError((data) => logError("socket onConnectError $data"));
    socket?.onError((data) => logError("socket onError $data"));
  }

  void clearSocketIO() {
    if (socket == null) return;
    socket?.disconnect();
    socket = null;
  }
}
