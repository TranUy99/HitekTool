import 'package:tool/common/component/component.dart';
import 'package:tool/common/config/image_paths.dart';
import 'package:tool/common/theme/styles.dart';
import 'package:tool/modules/dashboard/dashboard_page.dart';
import 'package:tool/modules/grid_view/grid_view_page.dart';
import 'package:tool/modules/list_view/list_view_page.dart';
import 'package:tool/modules/main/main_controller.dart';
import 'package:tool/widgets/custom_svg_image.dart';
import 'package:tool/widgets/wrap_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarModel {
  String label;
  String icon;
  Widget page;

  BottomBarModel({
    required this.label,
    required this.icon,
    required this.page,
  });
}

class MainPage extends GetWidget<MainController> {
  Widget renderBottomTab(BottomBarModel bottomBarModel, {int index = 0}) {
    return Obx(
      () => Expanded(
        child: InkWell(
          onTap: () => controller.onItemTapped(index),
          child: Ink(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvgImage(
                  imagePath: bottomBarModel.icon,
                  size: 24,
                  color: index == controller.selectedIndex.value ? Theme.of(Get.context!).primaryColor : Component.color.grey500,
                ),
                SizedBox(height: heightScale(2)),
                Text(
                  bottomBarModel.label,
                  style: Component.textStyle.smallBold.copyWith(
                    color: index == controller.selectedIndex.value ? Theme.of(Get.context!).primaryColor : Component.color.grey500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem renderBottomBar(BottomBarModel bottomBarModel, {int index = 0}) {
    return BottomNavigationBarItem(
      activeIcon: renderBottomTab(bottomBarModel, index: index),
      icon: renderBottomTab(bottomBarModel, index: index),
      label: bottomBarModel.label,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<BottomBarModel> listBottomBar = [
      BottomBarModel(
        label: "dashboard".tr,
        icon: ImagePaths.dashboard,
        page: DashboardPage(),
      ),
      BottomBarModel(
        label: "kpi".tr,
        icon: ImagePaths.kpi,
        page: GridViewPage(),
      ),
      BottomBarModel(
        label: "shop_list".tr,
        icon: ImagePaths.bulletList,
        page: ListViewPage(),
      ),
      BottomBarModel(
        label: "quick_access".tr,
        icon: ImagePaths.quickAccess,
        page: Container(),
      ),
    ];
    return WrapPage(
      bottomNavigationBar: Container(
        height: heightScale(72),
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Row(
          children: listBottomBar.asMap().map((index, value) => MapEntry(index, renderBottomTab(value, index: index))).values.toList(),
        ),
      ),
      child: WillPopScope(
        onWillPop: controller.onWillPop,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onPageChange,
          children: listBottomBar.map((e) => e.page).toList(),
        ),
      ),
    );
  }
}
