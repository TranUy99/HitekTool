import 'package:project/common/config/app_constants.dart';
import 'package:project/common/theme/styles.dart';
import 'package:project/modules/list_view/list_view_controller.dart';
import 'package:project/widgets/loadmore/custom_loadmore.dart';
import 'package:project/widgets/wrap_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewPage extends GetWidget<ListViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.stringList.value;
        var isLoading = list == null;
        return WrapPage(
          child: LoadMore(
            isLoading: isLoading,
            isFinish: controller.isOutOfData.value,
            onLoadMore: controller.onLoadMore,
            onRefresh: controller.onRefresh,
            child: ListView.builder(
              padding: padding(vertical: 22, horizontal: 16),
              itemCount: list?.length ?? PLACEHOLDER_ITEM_LENGTH,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  list?[index] ?? LONG_TITLE_PLACEHOLDER,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
