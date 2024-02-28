library routers;

import 'package:flutter_base_project/pages/home/view.dart';
import 'package:flutter_base_project/pages/index/view.dart';
import 'package:flutter_base_project/pages/launcher/view.dart';
import 'package:flutter_base_project/pages/login/view.dart';
import 'package:flutter_base_project/routers/middlewares/index.dart';
import 'package:flutter_base_project/routers/middlewares/launch.dart';
import 'package:flutter_base_project/routers/middlewares/login.dart';
import 'package:get/get.dart';

class Routers {
  static const String launch = '/launch';
  static const String index = '/index';
  static const String login = '/login';
  static const String notFound = '/notFound';
}

final unknownRouter = GetPage(
  name: Routers.notFound,
  transition: Transition.rightToLeft,
  page: () => HomePage(),
);

List<GetPage> _initRouters = [
  GetPage(
      name: Routers.launch,
      transition: Transition.fadeIn,
      middlewares: [LaunchMiddleware()],
      page: () => LauncherPage()),
  GetPage(
    name: Routers.login,
    transition: Transition.fadeIn,
    middlewares: [LoginMiddleware()],
    page: () => LoginPage(),
  ),
  GetPage(
    name: Routers.index,
    transition: Transition.fadeIn,
    middlewares: [IndexMiddleware()],
    page: () => IndexPage(),
  ),
];

List<GetPage> _getRouters() {
  // _indexRouters.addAll(iterable);
  return _initRouters;
}

List<GetPage> get routers => _getRouters();
