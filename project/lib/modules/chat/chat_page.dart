import 'package:project/common/config/app_constants.dart';
import 'package:project/modules/chat/chat_controller.dart';
import 'package:project/widgets/channel/channel_item.dart';
import 'package:project/widgets/custom_app_bar.dart';
import 'package:project/widgets/custom_divider.dart';
import 'package:project/widgets/loadmore/custom_loadmore.dart';
import 'package:project/widgets/wrap_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var isLoading = controller.channels.value == null;
        var list = controller.channels.value;
        return WrapPage(
          child: Column(
            children: [
              CustomAppBar(
                showBack: false,
                title: 'chat'.tr,
              ),
              Expanded(
                child: LoadMore(
                  isLoading: isLoading,
                  isFinish: controller.isOutOfData.value,
                  onLoadMore: controller.onLoadMore,
                  onRefresh: controller.onRefresh,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const CustomDivider(),
                    itemCount: list?.length ?? PLACEHOLDER_ITEM_LENGTH,
                    itemBuilder: (context, index) {
                      var item = list?[index];
                      return ChannelItem(key: UniqueKey(), channel: item);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
