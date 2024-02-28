import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class IndexPage extends StatelessWidget {
  IndexPage({super.key});

  final logic = Get.put(IndexLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: TabBarView(
          controller: logic.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: logic.children,
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.black),
              activeIcon: Icon(Icons.home, color: Colors.black),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined, color: Colors.black),
              activeIcon: Icon(Icons.person, color: Colors.black),
              label: '我的',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 2,
          currentIndex: logic.currentIndex.value,
          onTap: logic.onNavigationBarItemTap,
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
