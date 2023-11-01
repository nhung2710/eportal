import 'package:eportal/constant/application_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalApplication {
  static final GlobalApplication _instance = GlobalApplication._internal();
  String _UserName = ApplicationConstant.EMPTY;
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

  set UserPassword(String UserPassword) => _UserPassword = UserPassword;

  GlobalApplication._internal() {
    _UserName = "eportal";
    _UserPassword = "CT03-M14IC-PO22SE-0SOFT4-A0P1J";
  }
}
