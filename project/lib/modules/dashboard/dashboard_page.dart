import 'package:project/common/component/component.dart';
import 'package:project/common/theme/styles.dart';
import 'package:project/modules/dashboard/dashboard_controller.dart';
import 'package:project/utils/gap.dart';
import 'package:project/widgets/custom_button.dart';
import 'package:project/widgets/custom_text_field.dart';
import 'package:project/widgets/wrap_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetWidget<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(
      child: ListView(
        padding: padding(all: 16),
        children: [
          Text(
            "H1",
            style: Component.textStyle.h1,
          ),
          Text(
            "H3",
            style: Component.textStyle.h3,
          ),
          Text(
            "H4",
            style: Component.textStyle.h4,
          ),
          Text(
            "H5",
            style: Component.textStyle.h5,
          ),
          Text(
            "Large bold".tr,
            style: Component.textStyle.largeBold,
          ),
          Text(
            "Normal".tr,
          ),
          Text(
            "Medium Regular".tr,
            style: Component.textStyle.mediumRegular,
          ),
          CustomButton(title: "KPI".tr, onPressed: controller.onNavigateToKPI),
          CustomButton(title: "Hiện dialog".tr, onPressed: controller.onShowDialog),
          CustomButton(title: "is active = true".tr, onPressed: () {}),
          CustomButton(title: "is outline = true".tr, isOutline: true, onPressed: () {}),
          CustomButton(title: "is active = false".tr, isActive: false, onPressed: () {}),
          CustomTextField(
            labelText: "identification_number".tr,
            hintText: "identification_number".tr,
          ),
          CustomButton(title: "change_language_to_vn".tr, onPressed: () => controller.onChangeLanguage("vi")),
          CustomButton(title: "change_language_to_en".tr, onPressed: () => controller.onChangeLanguage("en")),
          CustomButton(title: "change_theme".tr, onPressed: controller.onChangeTheme)
        ].gapVertical(heightScale(16)),
      ),
    );
  }
}
