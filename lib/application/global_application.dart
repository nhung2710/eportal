import 'dart:io';

import 'package:eportal/enum/role_type.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/application_constant.dart';
import '../extension/string_extension.dart';

class GlobalApplication {
  static final GlobalApplication _instance = GlobalApplication._internal();
  String userName = ApplicationConstant.EMPTY;
  String userNameSaved = ApplicationConstant.EMPTY;
  String userPasswordSaved = ApplicationConstant.EMPTY;
  bool isFirstRunApp = false;
  bool isAutoLogin = false;
  String fullName = ApplicationConstant.EMPTY;
  String userPassword = ApplicationConstant.EMPTY;
  String userId = ApplicationConstant.EMPTY;
  String userRole = ApplicationConstant.EMPTY;
  String dirPath = ApplicationConstant.EMPTY;
  Uri appUri = Uri();
  RoleType roleType = RoleType.anonymous;
  SharedPreferences? preferences;
  PackageInfo? packageInfo;

  factory GlobalApplication() {
    return _instance;
  }

  String createXml(Object? value, String tag) {
    var buffer = StringBuffer();
    buffer.write('<$tag>');
    //buffer.write('<![CDATA[');
    if (value != null) {
      buffer.write(value);
    } else {
      buffer.write(ApplicationConstant.EMPTY);
    }
    //buffer.write(']]>');
    buffer.write('</$tag>');
    return buffer.toString();
  }

  bool get isLogin => roleType != RoleType.anonymous;

  String getStringOneTimePreferences(String key) {
    var value = (preferences?.getString(key)).replaceWhenNullOrEmpty();
    preferences?.remove(key);
    return value;
  }

  String HelloMessage() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    String message = ApplicationConstant.EMPTY;

    if (currentHour >= 6 && currentHour <= 11) {
      message = "buổi sáng";
    } else if (currentHour >= 11 && currentHour <= 16) {
      message = "buổi trưa";
    } else if (currentHour >= 16 && currentHour <= 19) {
      message = "buổi chiều";
    } else {
      message = "buổi tối";
    }

    return "Chúc bạn $message tốt lành";
  }

  Future<void> signIn(
      DangNhapDataResponse? data, String userName, String password) async {
    if (data != null) {
      roleType = data.roleType;
      if (roleType != RoleType.anonymous) {
        userRole = data.role.replaceWhenNullOrWhiteSpace();
        fullName = data.userName.replaceWhenNullOrWhiteSpace();
        userName = userName;
        userNameSaved = userName;
        userId = data.userID.replaceWhenNullOrWhiteSpace();
        userPassword = password;
        userPasswordSaved = password;
        isAutoLogin = true;
        return Future.wait([
          preferences!.setString(ApplicationConstant.USER_NAME, userName),
          preferences!.setString(ApplicationConstant.USER_PASSWORD, password),
          preferences!.setBool(ApplicationConstant.AUTO_LOGIN, isAutoLogin),
        ]).then((value) => {});
      }
    }
  }

  Future<void> signOut() async {
    fullName = "bạn";
    userName = ApplicationConstant.EMPTY;
    userPassword = ApplicationConstant.EMPTY;
    userId = ApplicationConstant.EMPTY;
    userRole = ApplicationConstant.EMPTY;
    roleType = RoleType.anonymous;
    isAutoLogin = false;
    if (preferences != null) {
      return preferences!
          .setBool(ApplicationConstant.AUTO_LOGIN, isAutoLogin)
          .then((value) => {});
    }
  }

  String helloUser() {
    return "Chào $fullName";
  }

  void shareApp() {
    Share.share("$appUri", subject: "Chia sẻ ứng dụng");
  }

  GlobalApplication._internal() {
    signOut();

    final appId =
        Platform.isAndroid ? 'YOUR_ANDROID_PACKAGE_ID' : 'YOUR_IOS_APP_ID';
    appUri = Uri.parse(Platform.isAndroid
        ? "market://details?id=$appId"
        : "https://apps.apple.com/app/id$appId");
  }
}
