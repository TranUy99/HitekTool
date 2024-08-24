import 'package:tool/common/component/component.dart';
import 'package:flutter/material.dart';

class ComponentBorder {
  BoxBorder border({Color? color}) => Border.all(color: color ?? Component.color.borderColor, width: 1);

  final OutlineInputBorder borderTextField = OutlineInputBorder(
    borderRadius: Component.radius.radius8,
    borderSide: BorderSide(color: Component.color.grey300, width: 1),
  );

  final OutlineInputBorder focusedBorderTextField = OutlineInputBorder(
    borderRadius: Component.radius.radius8,
    borderSide: BorderSide(color: Component.color.primaryColor, width: 1),
  );
}
