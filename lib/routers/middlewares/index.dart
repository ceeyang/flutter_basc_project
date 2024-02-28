import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 进入 APP 拦截跳转
class IndexMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}
