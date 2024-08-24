import 'dart:io';

import 'package:project/common/config/app_config.dart';
import 'package:project/common/theme/app_theme.dart';
import 'package:project/data/common/base_service.dart';
import 'package:project/data/services/account_service.dart';
import 'package:project/data/services/local_service.dart';
import 'package:project/data/services/localization_service.dart';
import 'package:project/data/services/theme_service.dart';
import 'package:project/routes/app_pages.dart';
import 'package:project/utils/responsive/size_config.dart';
import 'package:project/utils/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig config = AppConfig(config: {BASE_URL: 'BASE_URL'});
  Get.put<AppConfig>(config, permanent: true);
  await GetStorage.init();

  Get.lazyPut(() => BaseService());

  Get.put<LocalService>(LocalService(), permanent: true);

  Get.put<ThemeService>(ThemeService(localService: Get.find()), permanent: true);

  Get.put<AccountService>(AccountService(localService: Get.find()), permanent: true);

  Get.put<LocalizationService>(LocalizationService(localService: Get.find()), permanent: true);

  var getMaterialApp = GetMaterialApp(
    themeMode: ThemeService(localService: Get.find()).getThemeMode(),
    debugShowCheckedModeBanner: false,
    theme: lightThemeData,
    darkTheme: darkThemeData,
    getPages: AppPages.pages,
    initialRoute: Routes.splash,
    initialBinding: BindingsBuilder(() {}),
    builder: EasyLoading.init(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
        child: ScrollConfiguration(
          behavior: DisableGlowBehavior(),
          child: child!,
        ),
      ),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig(
              designScreenWidth: 375,
              designScreenHeight: 812,
            ).init(constraints, orientation);

            return getMaterialApp;
          },
        );
      },
    ));
  });
}
