import 'package:project/common/config/app_constants.dart';
import 'package:project/common/config/app_enum.dart';
import 'package:project/common/theme/styles.dart';
import 'package:project/data/models/message/text_message.dart';
import 'package:project/data/models/user.dart';
import 'package:project/modules/chat_detail/chat_detail_controller.dart';
import 'package:project/widgets/chat_text_input/chat_text_input.dart';
import 'package:project/widgets/custom_app_bar.dart';
import 'package:project/widgets/loadmore/custom_loadmore.dart';
import 'package:project/widgets/message/message_item.dart';
import 'package:project/widgets/wrap_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_persistent_keyboard_height/flutter_persistent_keyboard_height.dart';
import 'package:get/get.dart';

class ChatDetailPage extends GetWidget<ChatDetailController> {
  _buildMessageList() {
    return Obx(
      () {
        var isLoading = controller.messages.value == null;
        var list = controller.messages.value;
        return GestureDetector(
          onTap: controller.onTap,
          child: LoadMore(
            isLoading: isLoading,
            isLeafSkeleton: true,
            isFinish: controller.isOutOfData.value,
            onLoadMore: controller.onLoadMore,
            child: ListView.separated(
              controller: controller.scrollController,
              reverse: true,
              padding: padding(all: 8),
              separatorBuilder: (context, index) => SizedBox(
                height: heightScale(8),
              ),
              itemCount: list?.length ?? PLACEHOLDER_ITEM_LENGTH,
              itemBuilder: (context, index) {
                var item = list?[index] ?? TextMessage.fakeData.copyWith(user: User(), type: MessageType.msg);
                return MessageItem(key: Key(item.id ?? ''), message: item);
              },
            ),
          ),
        );
      },
    );
  }

  _buildChatInput() {
    return Obx(
      () {
        return ChatTextInput(
          textInputController: controller.textInputController,
          focusNode: controller.focusNode,
          isShowSticker: controller.isShowSticker.value,
          switchShowSticker: controller.switchShowSticker,
          onAddMessage: controller.onAddMessage,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WrapPage(
      resizeToAvoidBottomInset: false,
      isSafeAreaBottom: false,
      child: PersistentKeyboardHeightProvider(
        child: Column(
          children: [
            CustomAppBar(
              showBack: false,
              title: 'chat_detail'.tr,
            ),
            Expanded(
              child: _buildMessageList(),
            ),
            _buildChatInput(),
          ],
        ),
      ),
    );
  }
}
