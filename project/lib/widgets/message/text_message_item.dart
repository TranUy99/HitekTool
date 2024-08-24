import 'package:project/common/component/component.dart';
import 'package:project/data/models/message/text_message.dart';
import 'package:project/widgets/message/bubble.dart';
import 'package:flutter/material.dart';

class TextMessageItem extends StatelessWidget {
  final TextMessage? message;
  const TextMessageItem({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isMyMessage = message?.isMyMessage == true;
    final backgroundColor = !isMyMessage ? Component.color.grey500 : null;
    return Bubble(
      backgroundColor: backgroundColor,
      child: Text(
        message?.message ?? '',
        style: Component.textStyle.mediumRegular.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
