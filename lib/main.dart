import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/page/data_center/view/data_center_page.dart';
import 'package:eportal/page/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/adapter/base/base_adapter_api.dart';
import 'api/model/request/commonnew/home_works_list_request.dart';
import 'api/model/response/commonnew/home_works_list_response.dart';
import 'application/global_application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  GlobalApplication().Preferences = await SharedPreferences.getInstance();
  GlobalApplication().UserName = GlobalApplication().Preferences.getString(ApplicationConstant.USERNAME).replaceWhenNullOrWhiteSpace();
  GlobalApplication().UserPassword = GlobalApplication().Preferences.getString(ApplicationConstant.USERPASSWORD).replaceWhenNullOrWhiteSpace();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng dụng demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,

      ),
      home: const DataCenterPage()
    );
  }
}
