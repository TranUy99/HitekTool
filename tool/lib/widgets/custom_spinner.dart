import 'package:tool/common/component/component.dart';
import 'package:tool/common/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomSpinner extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  const CustomSpinner({
    super.key,
    this.size = 24,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widthScale(size),
      width: widthScale(size),
      child: Center(
        child: CircularProgressIndicator(
          color: Component.color.primaryColor,
          strokeWidth: widthScale(strokeWidth ?? 4),
        ),
      ),
    );
  }
}
