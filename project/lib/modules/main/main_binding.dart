import 'package:project/modules/dashboard/dashboard_controller.dart';
import 'package:project/modules/grid_view/grid_view_controller.dart';
import 'package:project/modules/list_view/list_view_controller.dart';
import 'package:project/modules/main/main_controller.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.create(() => DashboardController(themeService: Get.find(), localizationService: Get.find()));
    Get.create(() => GridViewController());
    Get.create(() => ListViewController());
    Get.create(() => MainController(accountService: Get.find()));
  }
}
