import 'package:project/common/component/component.dart';
import 'package:project/common/theme/styles.dart';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  const Bubble({
    super.key,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorsScheme = Theme.of(context).colorScheme;
    final color = backgroundColor ?? colorsScheme.primary;
    final borderRadius = Component.radius.radius8;
    return Container(
      padding: padding(all: 8),
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: child,
    );
  }
}
