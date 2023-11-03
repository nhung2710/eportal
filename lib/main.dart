import 'dart:io';

import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/screen/dashboard/page/dashboard_page.dart';
import 'package:eportal/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/global_application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  GlobalApplication().Preferences = await SharedPreferences.getInstance();
  GlobalApplication().UserName = GlobalApplication().Preferences.getString(ApplicationConstant.USERNAME).replaceWhenNullOrWhiteSpace();
  GlobalApplication().UserPassword = GlobalApplication().Preferences.getString(ApplicationConstant.USERPASSWORD).replaceWhenNullOrWhiteSpace();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eportal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,

      ),
      home: const DashboardPage()
    );
  }
}
