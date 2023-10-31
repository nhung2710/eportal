
class GlobalApplication {
  static final GlobalApplication _instance = GlobalApplication._internal();
  String _UserName = "";
  String _UserPassword= "";
  String get UserName => _UserName;
  String get UserPassword => _UserPassword;

  factory GlobalApplication() {
    return _instance;
  }

  set SetUserName(String UserName) => _UserName = UserName;
  set SetUserPassword(String UserPassword) => _UserPassword = UserPassword;

  GlobalApplication._internal() {
    _UserName = "";
    _UserPassword = "";
  }
}