import 'package:flutter/material.dart';
import 'package:flutter_base_project/pages/home/view.dart';
import 'package:get/get.dart';

class IndexLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final currentIndex = 0.obs;
  late TabController tabController;

  final children = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  void onInit() {
    tabController = TabController(length: children.length, vsync: this);
    super.onInit();
  }

  void onNavigationBarItemTap(index) {
    currentIndex.value = index;
  }
}
