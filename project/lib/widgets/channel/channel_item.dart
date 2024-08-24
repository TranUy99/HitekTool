import 'package:project/common/component/component.dart';
import 'package:project/common/config/app_constants.dart';
import 'package:project/common/theme/styles.dart';
import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:project/data/models/message/text_message.dart';
import 'package:project/modules/chat_detail/chat_detail_params.dart';
import 'package:project/routes/app_pages.dart';
import 'package:project/widgets/channel/circle_container.dart';
import 'package:project/widgets/custom_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChannelItem extends StatelessWidget {
  final BaseChannel? channel;
  const ChannelItem({super.key, required this.channel});

  _onTap() {
    if (channel == null) return;
    Get.toNamed(Routes.chatDetail, arguments: ChatDetailParams(channel!));
  }

  _getMessage() {
    if (channel?.lastMessage == null) return SHORT_TITLE_PLACEHOLDER;
    final lastMessage = channel?.lastMessage;
    if (lastMessage is TextMessage) {
      return lastMessage.message;
    }
    return "Sent a file";
  }

  @override
  Widget build(BuildContext context) {
    var user = channel?.members != null && channel!.members!.isNotEmpty ? channel!.members![0] : null;
    var unreadMessagesCount = channel?.unreadMessagesCount ?? 0;

    return InkWell(
      onTap: _onTap,
      child: Ink(
        padding: padding(all: 16),
        decoration: BoxDecoration(
          borderRadius: Component.radius.radius8,
        ),
        child: Row(
          children: [
            CustomAvatar(
              url: user?.thumbnail,
              size: 44,
              hash: user?.hash,
            ),
            SizedBox(
              width: widthScale(16),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.name ?? LONG_TITLE_PLACEHOLDER,
                    style: Component.textStyle.mediumBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: heightScale(8),
                  ),
                  Text(
                    _getMessage(),
                    style: unreadMessagesCount == 0 ? Component.textStyle.smallRegular : Component.textStyle.smallBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: widthScale(16),
            ),
            unreadMessagesCount != 0
                ? CircleContainer(
                    color: Colors.red,
                    size: 24,
                    child: Text(
                      '${unreadMessagesCount > 99 ? '99+' : unreadMessagesCount}',
                      style: Component.textStyle.exSmallRegular.copyWith(color: Colors.white),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
