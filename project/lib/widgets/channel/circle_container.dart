import 'package:project/common/component/component.dart';
import 'package:project/common/theme/styles.dart';
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final double size;
  final Color? color;
  final Widget? child;
  const CircleContainer({
    super.key,
    required this.size,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthScale(size),
      height: widthScale(size),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: Component.radius.custom(
          widthScale(size / 2),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
