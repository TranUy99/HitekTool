import 'dart:io';

import 'package:project/common/config/app_config.dart';
import 'package:project/data/common/rest_api.dart';
import 'package:project/data/services/local_service.dart';
import 'package:project/utils/log.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BaseService extends GetxService {
  late RestAPI client;
  final dio = Dio();

  @override
  void onInit() {
    final iOHttpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseHeader: false,
          responseBody: true,
          request: true,
          requestBody: true,
        ),
      );
    }
    dio.interceptors.add(LogInterceptor(responseHeader: false, responseBody: true, request: true, requestBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      LocalService localService = Get.find();
      final token = localService.token;

      if (token != null) {
        options.headers['Authorization'] = "Bearer $token";
      }
      logInfo(options.headers);
      handler.next(options);
    }));
    dio.httpClientAdapter = iOHttpClientAdapter;

    AppConfig conf = Get.find();
    client = RestAPI(
      dio,
      baseUrl: conf.baseURL,
    );
    super.onInit();
  }
}
