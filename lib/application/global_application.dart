import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/application_constant.dart';
import '../extension/string_extension.dart';
import 'package:eportal/enum/role_type.dart';


class GlobalApplication {
  static final GlobalApplication _instance = GlobalApplication._internal();
  String UserName = ApplicationConstant.EMPTY;
  String UserNameSaved = ApplicationConstant.EMPTY;
  String UserPasswordSaved = ApplicationConstant.EMPTY;
  String FullName = ApplicationConstant.EMPTY;
  String UserPassword = ApplicationConstant.EMPTY;
  String UserId = ApplicationConstant.EMPTY;
  RoleType UserRoleType = RoleType.anonymous;
  SharedPreferences? Preferences;

  factory GlobalApplication() {
    return _instance;
  }

  bool get IsLogin => UserRoleType != RoleType.anonymous;

  String getStringOneTimePreferences(String key) {
    var value = (Preferences?.getString(key)).replaceWhenNullOrEmpty();
    Preferences?.remove(key);
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
      UserRoleType = data.roleType;
      if (UserRoleType != RoleType.anonymous) {
        FullName = data.userName.supportHtml();
        UserName = userName;
        UserNameSaved = userName;
        UserId = data.userID.replaceWhenNullOrWhiteSpace();
        UserPassword = password;
        UserPasswordSaved = password;
        await Preferences?.setString(ApplicationConstant.USER_NAME, UserName);
        await Preferences?.setString(
            ApplicationConstant.USER_PASSWORD, UserPassword);
        await Preferences?.setBool(ApplicationConstant.AUTO_LOGIN, true);
      }
    }
  }

  Future<void> signOut() async {
    FullName = "bạn";
    UserName = ApplicationConstant.EMPTY;
    UserPassword = ApplicationConstant.EMPTY;
    UserId = ApplicationConstant.EMPTY;
    await Preferences?.setBool(ApplicationConstant.AUTO_LOGIN, false);
  }

  String helloUser() {
    return "Chào $FullName";
  }

  GlobalApplication._internal() {
    signOut();
  }
}
