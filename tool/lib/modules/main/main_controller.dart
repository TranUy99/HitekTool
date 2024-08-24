import 'dart:async';

import 'package:tool/data/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final AccountService accountService;

  MainController({
    required this.accountService,
  });

  late PageController pageController;

  var doubleBackToExitPressedOnce = false;

  int value = 0;

  Rx<int> selectedIndex = Rx(0);

  Future<bool> onWillPop() async {
    if (doubleBackToExitPressedOnce) {
      // onShowExitDialog();
      return false;
    }
    doubleBackToExitPressedOnce = true;
    Future.delayed(const Duration(seconds: 2), () {
      doubleBackToExitPressedOnce = false;
    });
    return false;
  }

  onPageChange(int index) {
    selectedIndex.value = index;
  }

  onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    selectedIndex.close();

    super.onClose();
  }
}
