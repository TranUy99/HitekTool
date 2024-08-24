import 'package:tool/common/component/component.dart';
import 'package:tool/common/config/image_paths.dart';
import 'package:tool/common/theme/styles.dart';
import 'package:tool/widgets/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<T?> showInfoDialog<T>({
    String title = "",
    Widget? content,
  }) {
    return showDialog<T>(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: SizedBox(
            width: Get.width - widthScale(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: padding(top: 15, right: 13),
                      child: Container(
                        padding: padding(vertical: 24, horizontal: 24),
                        decoration: BoxDecoration(borderRadius: Component.radius.radius8, color: Theme.of(context).dialogBackgroundColor),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: Component.textStyle.h4,
                            ),
                            if (content != null)
                              Padding(
                                padding: padding(top: 8),
                                child: content,
                              ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: Get.back,
                        child: Container(
                          width: widthScale(40),
                          height: widthScale(40),
                          decoration: BoxDecoration(
                            color: Theme.of(context).dialogBackgroundColor,
                          ),
                          child: const Center(
                            child: CustomSvgImage(
                              imagePath: ImagePaths.close,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
