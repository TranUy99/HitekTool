import 'package:project/common/theme/styles.dart';
import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  final IconData icon;
  final Function() callback;
  const ChatIconButton({
    super.key,
    required this.icon,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = colorScheme.primary;
    return IconButton(
      onPressed: callback,
      padding: padding(all: 4),
      iconSize: widthScale(24),
      constraints: const BoxConstraints(),
      style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
