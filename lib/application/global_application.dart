import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/application_constant.dart';
import '../extension/string_extension.dart';
import 'package:eportal/enum/role_type.dart';

class GlobalApplication {
  static final GlobalApplication _instance = GlobalApplication._internal();
  String userName = ApplicationConstant.EMPTY;
  String userNameSaved = ApplicationConstant.EMPTY;
  String userPasswordSaved = ApplicationConstant.EMPTY;
  String fullName = ApplicationConstant.EMPTY;
  String userPassword = ApplicationConstant.EMPTY;
  String userId = ApplicationConstant.EMPTY;
  String dirPath = ApplicationConstant.EMPTY;
  RoleType roleType = RoleType.anonymous;
  SharedPreferences? preferences;

  factory GlobalApplication() {
    return _instance;
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
        fullName = data.userName.replaceWhenNullOrWhiteSpace();
        userName = userName;
        userNameSaved = userName;
        userId = data.userID.replaceWhenNullOrWhiteSpace();
        userPassword = password;
        userPasswordSaved = password;
        return Future.wait([
          preferences!.setString(ApplicationConstant.USER_NAME, userName),
          preferences!.setString(ApplicationConstant.USER_PASSWORD, password),
          preferences!.setBool(ApplicationConstant.AUTO_LOGIN, true),
        ]).then((value) => {});
      }
    }
  }

  Future<void> signOut() async {
    fullName = "bạn";
    userName = ApplicationConstant.EMPTY;
    userPassword = ApplicationConstant.EMPTY;
    userId = ApplicationConstant.EMPTY;
    if (preferences != null) {
      return preferences!
          .setBool(ApplicationConstant.AUTO_LOGIN, false)
          .then((value) => {});
    }
  }

  String helloUser() {
    return "Chào $fullName";
  }

  GlobalApplication._internal() {
    signOut();
  }
}
