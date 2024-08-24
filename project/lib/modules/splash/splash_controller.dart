import 'package:project/data/services/localization_service.dart';
import 'package:project/data/services/theme_service.dart';
import 'package:project/routes/app_pages.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final ThemeService themeService;
  final LocalizationService localizationService;

  SplashController({required this.themeService, required this.localizationService});
  goToMainPage() {
    FlutterNativeSplash.remove();
    // get theme from local
    loadTheme();
    loadLanguage();

    Get.offAllNamed(Routes.main);
  }

  loadTheme() {
    themeService.loadTheme();
  }

  loadLanguage() {
    localizationService.loadLanguage();
  }

  @override
  void onInit() async {
    super.onInit();
    //await loadData();
    Future.delayed(const Duration(seconds: 2), goToMainPage);
  }
}
