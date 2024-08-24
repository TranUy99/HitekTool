import 'package:project/common/component/component.dart';
import 'package:project/common/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? backgroundColor;
  final double? heightButton;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  final Widget? icon;
  final BoxBorder? border;
  final bool? isActive;
  final bool? isOutline;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.heightButton,
    this.borderRadius,
    this.textStyle,
    this.icon,
    this.border,
    this.isActive = true,
    this.isOutline = false,
  });
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final style = textStyle ?? Component.textStyle.largeSemiBold.copyWith(color: isOutline! && isActive! ? colorScheme.primary : Colors.white);
    final radius = borderRadius ?? Component.radius.radius100;
    final background = backgroundColor ??
        (isActive!
            ? isOutline!
                ? Colors.transparent
                : colorScheme.primary
            : Component.color.grey200);

    final borderButton = border ?? (isActive! && isOutline! ? Component.border.border(color: colorScheme.primary) : null);
    return Material(
      borderRadius: radius,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        borderRadius: radius,
        child: Ink(
          height: heightButton ?? heightScale(45),
          decoration: BoxDecoration(
            color: background,
            borderRadius: radius,
            border: borderButton,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              Text(
                title,
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
