import 'package:tool/common/component/component.dart';
import 'package:tool/common/config/app_constants.dart';
import 'package:tool/common/theme/styles.dart';
import 'package:tool/data/models/feed.dart';
import 'package:tool/modules/grid_view/grid_view_controller.dart';
import 'package:tool/widgets/custom_avatar.dart';
import 'package:tool/widgets/loadmore/custom_loadmore.dart';
import 'package:tool/widgets/wrap_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewPage extends GetWidget<GridViewController> {
  Widget renderItem(Feed? feed) {
    return Stack(
      key: Key(feed?.id ?? ''),
      fit: StackFit.expand,
      children: [
        CustomAvatar(
          url: feed?.image,
          hash: feed?.hash,
          onTap: () => controller.onPressFeedItem(feed),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              feed?.title ?? '',
              style: Component.textStyle.mediumSemiBold.copyWith(color: Colors.white),
            ),
            Text(
              feed?.description ?? '',
              style: Component.textStyle.mediumRegular.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.feedList.value;
        var isLoading = list == null;
        return WrapPage(
          child: LoadMore(
            isLoading: isLoading,
            isFinish: controller.isOutOfData.value,
            onLoadMore: controller.onLoadMore,
            onRefresh: controller.onRefresh,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: widthScale(16),
                  crossAxisSpacing: widthScale(16),
                  childAspectRatio: 1,
                ),
                padding: padding(vertical: 22, horizontal: 16),
                itemCount: list?.length ?? PLACEHOLDER_ITEM_LENGTH,
                itemBuilder: (context, index) {
                  var item = list?[index] ?? Feed.fakeFeed;
                  return renderItem(item);
                }),
          ),
        );
      },
    );
  }
}
