import 'dart:math';

import 'package:tool/data/models/feed.dart';
import 'package:tool/modules/grid_view/grid_view_params.dart';
import 'package:tool/routes/app_pages.dart';
import 'package:get/get.dart';

class GridViewController extends GetxController {
  String? image;
  Rx<List<Feed>?> feedList = Rx(null);
  var isOutOfData = false.obs;
  var page = 2;
  var limit = 20;

  Future<List<Feed>> getList({int? currentPage = 1}) async {
    await Future.delayed(const Duration(seconds: 1));

    return List.generate(
      currentPage == 5 ? limit - 1 : limit,
      (index) => Feed.fakeFeed,
    );
  }

  Future onRefresh() async {
    feedList.value = null;
    feedList.value = await getList(currentPage: 1);
    if (feedList.value!.length < limit) {
      isOutOfData.value = true;
    } else {
      isOutOfData.value = false;
      page = 2;
    }

    return Future;
  }

  Future<bool> onLoadMore() async {
    var list = await getList(currentPage: page);
    feedList.update((val) {
      val!.addAll(list);
    });
    if (list.length < limit) {
      isOutOfData.value = true;
    } else {
      page++;
    }

    return true;
  }

  onPressFeedItem(Feed? feed) {
    if (feed == null || !feed.isHavingImage) return;
    var randomId = Random().nextInt(50) + 100;
    Get.toNamed(
      Routes.kpi,
      arguments: GridViewParams("https://picsum.photos/id/$randomId/200/300"),
      preventDuplicates: false,
    );
  }

  @override
  void onInit() {
    var arguments = Get.arguments as GridViewParams?;
    image = arguments?.image;
    onRefresh();
    super.onInit();
  }
}
