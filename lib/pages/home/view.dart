import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(children: [
        _searchNavbar(context),
        _buildItemWithSpace(context),
        Expanded(
          child: TDTabBarView(
            isSlideSwitch: true,
            controller: logic.tabController,
            children: logic.tabs
                .map((e) => Container(
                    width: Get.width,
                    height: 300,
                    child: Center(child: Text(e))))
                .toList(),
          ),
        )
      ]),
    );
  }

  Widget _searchNavbar(BuildContext context) {
    return TDNavBar(
        useDefaultBack: false,
        screenAdaptation: false,
        centerTitle: false,
        titleMargin: 0,
        leftBarItems: [
          TDNavBarItem(icon: TDIcons.next, iconSize: 24),
        ],
        titleWidget: TDSearchBar(
          needCancel: false,
          autoHeight: true,
          padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
          placeHolder: '请输入主播昵称 / 主播ID',
          mediumStyle: true,
          style: TDSearchStyle.round,
          onTextChanged: (String text) {
            print('input：$text');
          },
        ),
        rightBarItems: [
          TDNavBarItem(icon: TDIcons.location, iconSize: 24),
          TDNavBarItem(icon: TDIcons.mail, iconSize: 24)
        ]);
  }

  Widget _buildItemWithSpace(BuildContext context) {
    return TDTabBar(
      tabs:
          logic.tabs.map((e) => TDTab(text: e, size: TDTabSize.large)).toList(),
      controller: logic.tabController,
      backgroundColor: Colors.white,
      labelPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      showIndicator: false,
      isScrollable: true,
    );
  }
}
