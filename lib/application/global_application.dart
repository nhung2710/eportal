import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalApplication {
  static final GlobalApplication _instance = GlobalApplication._internal();
  String _UserName = ApplicationConstant.EMPTY;
  String _FullName = ApplicationConstant.EMPTY;
  String _UserPassword = ApplicationConstant.EMPTY;
  late SharedPreferences _Preferences;
  String get UserName => _UserName;

  String get UserPassword => _UserPassword;
  SharedPreferences get Preferences => _Preferences;
  set Preferences(SharedPreferences preferences) {
    _Preferences = preferences;
  }

  factory GlobalApplication() {
    return _instance;
  }

  bool get IsLogin => _UserName.isNotEmpty && _UserPassword.isNotEmpty;

  set UserName(String UserName) => _UserName = UserName;
  set FullName(String FullName) => _FullName = FullName;
  String get FullName => _FullName;

  set UserPassword(String UserPassword) => _UserPassword = UserPassword;
  String HelloMessage()
  {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    String message = ApplicationConstant.EMPTY;

    if(currentHour >= 6  && currentHour <= 11)
      message = "buổi sáng";
    else
    if(currentHour >= 11  && currentHour <= 16)
      message = "buổi trưa";
    else
    if(currentHour >= 16  && currentHour <= 19)
      message = "buổi chiều";
    else
      message = "buổi tối";

    return "Chúc bạn $message tốt lành";
  }

  String HelloUser()
  {
    return "Chào $_FullName";
  }
  GlobalApplication._internal() {
    _FullName = "bạn";
    _UserPassword = ApplicationConstant.EMPTY;
    //_UserName = "eportal";
    //_UserPassword = "CT03-M14IC-PO22SE-0SOFT4-A0P1J";
  }
}
