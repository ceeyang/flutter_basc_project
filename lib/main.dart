import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/configs/app_config.dart';
import 'package:flutter_base_project/routers/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (AppConfig.isDebug) {
    runApp(const MyApp());
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConfig.uiSize,
      builder: (BuildContext context, Widget? widget) {
        return GetMaterialApp(
          enableLog: true,
          getPages: routers,
          unknownRoute: unknownRouter,
          initialRoute: Routers.launch,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            // widget = BotToastInit()(context, widget);
            // widget = FlutterSmartDialog.init(
            //         loadingBuilder: (msg) => const LoadingDialog())(
            //     context, widget);
            return MediaQuery(
              // 设置文字大小不随系统设置改变
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: widget!,
            );
          },
          // navigatorObservers: [
          //   BotToastNavigatorObserver(),
          //   FlutterSmartDialog.observer,
          // ],
        );
      },
    );
  }
}
