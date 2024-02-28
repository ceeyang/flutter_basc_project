import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LauncherPage extends StatelessWidget {
  final logic = Get.put(LauncherLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}
