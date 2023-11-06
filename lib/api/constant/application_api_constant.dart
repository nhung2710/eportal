class ApplicationApiConstant {

  static const BASE_AUTH_HEADER_USER_LOGIN = 'eportal';
  static const BASE_AUTH_HEADER_PASSWORD = 'CT03-M14IC-PO22SE-0SOFT4-A0P1J';
  static const BASE_URI = 'http://cms.eportal.top';
  static const BASE_URI_MEDIA = 'http://file.eportal.top/';
  static const BASE_API_URI = '$BASE_URI/api';
  static const BASE_API_APP_URI = '$BASE_URI/api/app';
  static const API_COMMON_NEW = '$BASE_API_APP_URI/commonnew.asmx';
  static const API_COMMON_NEW_OP = '$API_COMMON_NEW?op=';

  static const API_COMMONNEW_OP_HOME_WORKS_LIST = '$BASE_API_APP_URI/commonnew.asmx?op=HomeWorksList';
  static const API_COMMONNEW_OP_HOME_NEWS_LIST = '$BASE_API_APP_URI/commonnew.asmx?op=HomeNewsList';
  static const API_COMMONNEW_OP_HOME_SLIDE_LIST = '$BASE_API_APP_URI/commonnew.asmx?op=HomeSlideList';
}
