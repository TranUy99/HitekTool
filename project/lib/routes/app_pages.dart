import 'package:project/modules/dashboard/dashboard_binding.dart';
import 'package:project/modules/dashboard/dashboard_page.dart';
import 'package:project/modules/grid_view/grid_view_binding.dart';
import 'package:project/modules/grid_view/grid_view_page.dart';
import 'package:project/modules/list_view/list_view_binding.dart';
import 'package:project/modules/list_view/list_view_page.dart';
import 'package:project/modules/main/main_binding.dart';
import 'package:project/modules/main/main_page.dart';
import 'package:project/modules/splash/splash_binding.dart';
import 'package:project/modules/splash/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.main,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.list,
      page: () => ListViewPage(),
      binding: ListViewBinding(),
    ),
    GetPage(
      name: Routes.grid,
      page: () => GridViewPage(),
      binding: GridViewBinding(),
    ),
    GetPage(
      name: Routes.kpi,
      page: () => GridViewPage(),
      binding: GridViewBinding(),
    ),
  ];
}
