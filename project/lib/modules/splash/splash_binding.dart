import 'package:project/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(
        themeService: Get.find(),
        localizationService: Get.find(),
      ),
    );
  }
}
