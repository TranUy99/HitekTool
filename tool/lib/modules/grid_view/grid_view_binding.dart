import 'package:tool/modules/grid_view/grid_view_controller.dart';
import 'package:get/get.dart';

class GridViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.create(() => GridViewController());
  }
}
