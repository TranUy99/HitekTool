import 'package:project/modules/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(
        themeService: Get.find(),
        localizationService: Get.find(),
      ),
    );
  }
}
