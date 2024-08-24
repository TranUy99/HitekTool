import 'package:project/common/component/component.dart';
import 'package:project/common/config/app_enum.dart';
import 'package:project/common/config/image_paths.dart';
import 'package:project/common/theme/styles.dart';
import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/models/message/file_message.dart';
import 'package:project/data/models/message/reaction.dart';
import 'package:project/data/models/message/text_message.dart';
import 'package:project/utils/gap.dart';
import 'package:project/widgets/custom_avatar.dart';
import 'package:project/widgets/custom_spinner.dart';
import 'package:project/widgets/custom_svg_image.dart';
import 'package:project/widgets/message/file_message_item.dart';
import 'package:project/widgets/message/text_message_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageItem extends StatelessWidget {
  final BaseMessage? message;
  const MessageItem({
    super.key,
    required this.message,
  });

  Widget _buildMessage() {
    final castMessage = message;

    if (castMessage is TextMessage) {
      return TextMessageItem(message: castMessage);
    }
    if (castMessage is FileMessage) {
      return FileMessageItem(message: castMessage);
    }
    return const SizedBox();
  }

  _buildBaseMessage() {
    final avatar = message?.user?.thumbnail;
    final hash = message?.user?.hash;
    final isMyMessage = message?.isMyMessage == true;
    final reactions = message?.reactions?.where((element) => element.reaction != null).toList();
    final isHasReactions = reactions != null && reactions.isNotEmpty;
    return Row(
      mainAxisAlignment: isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMyMessage)
          CustomAvatar(
            size: 40,
            url: avatar,
            hash: hash,
          ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Get.width / 1.5),
          child: Stack(
            children: [
              Padding(
                padding: padding(bottom: isHasReactions ? 10 : 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: _buildMessage()),
                    if (message != null && message!.isPending)
                      Padding(
                        padding: padding(bottom: 2),
                        child: const CustomSpinner(
                          size: 8,
                          strokeWidth: 2,
                        ),
                      ),
                  ].gapHorizontal(widthScale(4)),
                ),
              ),
              if (isHasReactions)
                Positioned(
                  bottom: 0,
                  right: widthScale(2),
                  child: _buildReactions(reactions),
                ),
            ],
          ),
        ),
      ].gapHorizontal(widthScale(8)),
    );
  }

  Map<ReactionType, int> _getReactionMap(List<Reaction> reactions) {
    Map<ReactionType, int> reactionsGroup = {};
    for (var element in reactions) {
      final reaction = element.reaction!;
      if (reactionsGroup[reaction] == null) {
        reactionsGroup[reaction] = 1;
      } else {
        reactionsGroup[reaction] = reactionsGroup[reaction]! + 1;
      }
    }
    return reactionsGroup;
  }

  _buildReactions(List<Reaction> reactions) {
    final backgroundColor = Component.color.skyColor;
    final reactionMap = _getReactionMap(reactions);
    return Container(
        padding: padding(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: Component.radius.custom(24),
        ),
        child: Row(children: reactionMap.entries.map((e) => _buildReactionItem(e.key, e.value)).toList().gapHorizontal(widthScale(2))));
  }

  _getReactionPath(ReactionType reaction) {
    switch (reaction) {
      case ReactionType.smile:
        return ImagePaths.smile;
      case ReactionType.sad:
        return ImagePaths.sad;
      case ReactionType.heart:
        return ImagePaths.heart;
      default:
        return '';
    }
  }

  Widget _buildReactionItem(ReactionType reaction, int number) {
    final imagePath = _getReactionPath(reaction);
    return Row(
      children: [
        CustomSvgImage(
          imagePath: imagePath,
          size: 16,
        ),
        Text(
          '$number',
          style: Component.textStyle.smallMedium.copyWith(color: Colors.white),
        ),
      ].gapHorizontal(widthScale(2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBaseMessage();
  }
}
