import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNoResultWidget extends StatelessWidget {
  final String? text;
  final double? height;
  const CustomNoResultWidget({super.key, this.text, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          ListView(),
          Center(
            child: Text(
              text ?? "No data".tr,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
