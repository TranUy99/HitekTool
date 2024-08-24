import 'package:project/common/component/component.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Component.color.grey300,
      thickness: 1,
      height: 1,
    );
  }
}
