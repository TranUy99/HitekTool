import 'package:project/data/services/localization_service.dart';
import 'package:project/data/services/theme_service.dart';
import 'package:project/modules/grid_view/grid_view_params.dart';
import 'package:project/routes/app_pages.dart';
import 'package:project/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final ThemeService themeService;
  final LocalizationService localizationService;

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final TextEditingController channelEditingController = TextEditingController();

  DashboardController({
    required this.themeService,
    required this.localizationService,
  });

  onShowDialog() {
    DialogUtils.showInfoDialog(title: "Gửi khảo sát thành công");
  }

  onChangeTheme() {
    themeService.changeThemeMode();
  }

  onChangeLanguage(String langCode) {
    localizationService.changeLocale(langCode);
  }

  onNavigateToKPI() async {
    Get.toNamed(
      Routes.kpi,
      arguments: GridViewParams(
        "https://picsum.photos/id/237/200/300",
      ),
      preventDuplicates: false,
    );
  }
}
