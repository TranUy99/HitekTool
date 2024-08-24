import 'package:get/get.dart';

class ListViewController extends GetxController {
  Rx<List<String>?> stringList = Rx(null);
  var isOutOfData = false.obs;
  var page = 2;
  var limit = 20;

  Future<List<String>> getList({int? currentPage = 1}) async {
    await Future.delayed(const Duration(seconds: 1));
    // page == 5 => isOutOfData.value = true
    return List.generate(currentPage == 5 ? limit - 1 : limit, (index) => index.toString());
  }

  Future onRefresh() async {
    stringList.value = null;
    stringList.value = await getList(currentPage: 1);
    if (stringList.value!.length < limit) {
      isOutOfData.value = true;
    } else {
      isOutOfData.value = false;
      page = 2;
    }
    // clubList.update((val) {
    //   val?.removeWhere((element) => element.state == "HIDDEN");
    // });

    return Future;
  }

  Future<bool> onLoadMore() async {
    var list = await getList(currentPage: page);
    stringList.update((val) {
      val!.addAll(list);
    });
    if (list.length < limit) {
      isOutOfData.value = true;
    } else {
      page++;
    }

    return true;
  }

  @override
  void onInit() {
    onRefresh();
    super.onInit();
  }
}
