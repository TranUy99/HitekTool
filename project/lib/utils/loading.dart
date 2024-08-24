import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void showLoading() {
  EasyLoading.show(
    status: 'loading'.tr,
    maskType: EasyLoadingMaskType.black,
  );
}

void dismissLoading() {
  EasyLoading.dismiss();
}
