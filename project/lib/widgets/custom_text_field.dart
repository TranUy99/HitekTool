import 'package:project/common/component/component.dart';
import 'package:project/common/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final bool isPhone;
  final bool isPassword;
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final int? limit;
  final bool? readOnly;
  final bool? isArea;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final bool? isRequired;

  const CustomTextField({
    super.key,
    this.isPhone = false,
    this.isPassword = false,
    required this.labelText,
    this.hintText,
    this.controller,
    this.limit,
    this.readOnly = false,
    this.isArea = false,
    this.inputFormatters,
    this.inputType,
    this.minLines = 5,
    this.onChanged,
    this.isRequired = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (widget.inputFormatters != null) {
      return widget.inputFormatters;
    }

    if (widget.isPhone) {
      return [
        LengthLimitingTextInputFormatter(widget.limit ?? 11),
        FilteringTextInputFormatter.deny(RegExp('[\\.|\\,|\\-|\\ ]')),
      ];
    }
    if (widget.isPassword) {
      return [
        LengthLimitingTextInputFormatter(widget.limit ?? 20),
      ];
    }

    if (widget.limit != null) {
      return [LengthLimitingTextInputFormatter(widget.limit)];
    }
    return [];
  }

  _renderLabel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.labelText,
          style: Component.textStyle.smallRegular.copyWith(color: Component.color.grey300),
        ),
        if (widget.isRequired!)
          Text(
            " *",
            style: Component.textStyle.smallRegular.copyWith(color: Component.color.warningColor),
          )
      ],
    );
  }

  onTap() {}

  @override
  Widget build(BuildContext context) {
    var isDisable = widget.readOnly!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TextFormField(
                onChanged: widget.onChanged,
                controller: textEditingController,
                readOnly: isDisable,
                enabled: !isDisable,
                style: Component.textStyle.mediumMedium,
                inputFormatters: _getInputFormatters(),
                keyboardType: widget.inputType ??
                    (widget.isPhone
                        ? TextInputType.number
                        : widget.isArea!
                            ? TextInputType.multiline
                            : TextInputType.text),
                obscureText: widget.isPassword,
                minLines: widget.isArea! ? widget.minLines : 1,
                maxLines: widget.isArea! ? null : 1,
                decoration: InputDecoration(
                  label: _renderLabel(),
                  filled: true,
                  isDense: true,
                  fillColor: Component.color.backgroundTextField,
                  contentPadding: padding(vertical: 16, horizontal: 16),
                  border: Component.border.borderTextField,
                  enabledBorder: Component.border.borderTextField,
                  focusedBorder: Component.border.focusedBorderTextField,
                  disabledBorder: Component.border.borderTextField,
                  hintText: widget.hintText,
                  hintStyle: Component.textStyle.mediumMedium.copyWith(color: Component.color.hintColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
