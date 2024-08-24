import 'package:project/common/component/component.dart';
import 'package:project/common/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget {
  final Function? onBack;
  final String? title;
  final List<Widget>? actions;
  final bool? showBack;
  final double? height;
  const CustomAppBar({
    super.key,
    this.onBack,
    this.title,
    this.actions,
    this.showBack = true,
    this.height,
  });

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  double? get height => widget.height;
  bool? get showBack => widget.showBack;
  String get title => widget.title ?? '';
  List<Widget> get actions => widget.actions ?? [];

  back() {
    if (widget.onBack != null) {
      widget.onBack!();
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScale(height ?? 48),
      padding: padding(horizontal: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showBack == true)
                BackButton(
                  onPressed: back,
                ),
              Row(
                children: actions.map((e) => e).toList(),
              ),
            ],
          ),
          Text(
            title,
            style: Component.textStyle.largeBold,
          ),
        ],
      ),
    );
  }
}
