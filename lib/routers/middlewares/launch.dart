import 'package:flutter/material.dart';
import 'package:flutter_base_project/routers/index.dart';
import 'package:get/get.dart';

/// 进入 APP 拦截跳转
class LaunchMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return const RouteSettings(name: Routers.index);
  }
}
