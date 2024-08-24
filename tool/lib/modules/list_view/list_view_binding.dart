import 'package:tool/modules/list_view/list_view_controller.dart';
import 'package:get/get.dart';

class ListViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListViewController());
  }
}
