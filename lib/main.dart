import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:window_manager/window_manager.dart';

import 'page/share/splash/page/splash_page.dart';
import 'screen/anonymous/home/home_page.dart';
import 'style/app_color.dart';
import 'style/app_theme.dart';

Future<void> main() async {
  //ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: Size(414, 896),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}
class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
  };
}
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final PageStorageBucket _bucket = PageStorageBucket();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child) =>MaterialApp(
        title: 'Việc làm Hòa Bình',
        debugShowCheckedModeBanner: false,
        scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
        theme: ThemeData(
            textTheme: AppTheme.textTheme,
            cardTheme: const CardTheme(surfaceTintColor: Colors.white),
            iconTheme: const IconThemeData(color: Colors.white),
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.white)),
            tabBarTheme: const TabBarTheme(
                indicatorColor: AppColor.colorOfIcon,
                indicatorSize: TabBarIndicatorSize.tab),
            bottomSheetTheme: const BottomSheetThemeData(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColor.colorOfIcon,
                    width: 1,
                    strokeAlign: 1,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  ),
                ),

                surfaceTintColor: Colors.white,
                backgroundColor: Colors.white,
                modalBackgroundColor:  Colors.white
            ),
            dialogTheme: DialogTheme(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            dialogBackgroundColor: Colors.white),
        home: PageStorage(
          key: key,
          bucket: _bucket,
          child: child!,
          //child: isFirstRunApp ? const HomePage() : const HomePage(),
        ),
        builder: EasyLoading.init(builder: (context,child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.1)),
          child: child!,
        )),
      ),
      child: const SplashPage(),
    );
  }
}
