import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  List<String> tabs = [];

  late TabController tabController;

  @override
  void onInit() {
    tabs = ['附近', '推荐', '热门', '同城', '心热', '关注'];
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }
}
