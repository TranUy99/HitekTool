import 'package:tool/common/config/app_storage_key.dart';
import 'package:tool/data/services/local_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  LocalService localService;
  ThemeService({required this.localService});

  final _isDarkMode = false.obs;

  ThemeMode getThemeMode() {
    return _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return localService.appStorage.read(StorageKey.themeMode) ?? false;
  }

  saveThemMode(bool isDarkMode) {
    localService.appStorage.write(StorageKey.themeMode, isDarkMode);
  }

  loadTheme() async {
    if (isSavedDarkMode()) {
      _isDarkMode.value = true;
      Get.changeThemeMode(ThemeMode.dark);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }

  changeThemeMode() {
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    SystemChrome.setSystemUIOverlayStyle(_isDarkMode.value ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light);

    _isDarkMode.toggle();
    //save to storage
    saveThemMode(!isSavedDarkMode());
  }
}
