import 'package:tool/common/config/app_error.dart';
import 'package:tool/utils/dialog.dart';
import 'package:tool/utils/loading.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class IBaseRepository {
  handleError(dynamic error) {
    dismissLoading();
    switch (error.runtimeType) {
      case DioError:
        var dioError = error as DioError;
        switch (dioError.response?.statusCode) {
          case ErrorCode.deviceExpired:
            // handle here
            break;
          default:
            DialogUtils.showInfoDialog(
              title: "error_message_unknown".tr,
            );
            break;
        }
        break;

      default:
        DialogUtils.showInfoDialog(
          title: "error_message_unknown".tr,
        );
        break;
    }
  }
}
