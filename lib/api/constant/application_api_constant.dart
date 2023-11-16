class ApplicationApiConstant {
  static const BASE_AUTH_HEADER_USER_LOGIN = 'eportal';
  static const BASE_AUTH_HEADER_PASSWORD = 'CT03-M14IC-PO22SE-0SOFT4-A0P1J';
  static const BASE_URI = 'http://cms.eportal.top';
  static const BASE_URI_MEDIA = 'http://file.eportal.top/';
  static const BASE_API_URI = '$BASE_URI/api';
  static const BASE_API_APP_URI = '$BASE_URI/api/app';
  static const API_COMMON_NEW = '$BASE_API_APP_URI/commonnew.asmx';
  static const API_COMMON_NEW_OP = '$API_COMMON_NEW?op=';

  static const TIME_CACHE_LOW_DEFAULT = 60 * 5;
  static const TIME_CACHE_MEDIUM_DEFAULT = TIME_CACHE_LOW_DEFAULT * 6;
  static const TIME_CACHE_HIGH_DEFAULT = TIME_CACHE_MEDIUM_DEFAULT * 2;
  static const TIME_CACHE_DEFAULT = TIME_CACHE_HIGH_DEFAULT * 6;

  static const API_RESULT = 'Result';

  static const API_COMMON_NEW_OP_HOME_WORKS_LIST = "HomeWorksList";
  static const API_COMMON_NEW_OP_HOME_NEWS_LIST = "HomeNewsList";
  static const API_COMMON_NEW_OP_HOME_SLIDE_LIST = "HomeSlideList";
  static const API_COMMON_NEW_OP_HOME_JOB_USER_LIST = "HomeJobUserList";
  static const API_COMMON_NEW_OP_HOME_BUSINESS_LIST = "HomeBusinessList";
  static const API_COMMON_NEW_OP_HOME_DOCUMENT_LIST = "HomeDocumentList";
  static const API_COMMON_NEW_OP_GIOI_THIEU_TRUNG_TAM = "GioiThieuTrungTam";
  static const API_COMMON_NEW_OP_DANH_SACH_TINH_TP = "DanhSachTinhTP";
  static const API_COMMON_NEW_OP_TEN_TINH_TP = "TenTinhTP";
  static const API_COMMON_NEW_OP_DANH_SACH_QUAN_HUYEN = "DanhSachQuanHuyen";
  static const API_COMMON_NEW_OP_DANH_SACH_DOANH_NGHIEP = "DanhSachDoanhNghiep";
  static const API_COMMON_NEW_OP_DANH_SACH_MUC_LUONG = "DanhSachMucLuong";
  static const API_COMMON_NEW_OP_DANH_SACH_KINH_NGHIEM = "DanhSachKinhNghiem";
  static const API_COMMON_NEW_OP_DANH_SACH_GIOI_TINH = "DanhSachGioiTinh";
  static const API_COMMON_NEW_OP_DANH_SACH_TRINH_DO = "DanhSachTrinhDo";
  static const API_COMMON_NEW_OP_WORK_SEARCH = "WorkSearch";
  static const API_COMMON_NEW_OP_WORK_DETAIL = "WorkDetail";
  static const API_COMMON_NEW_OP_NEWS_SEARCH = "NewsSearch";
  static const API_COMMON_NEW_OP_NEWS_DETAIL = "NewsDetail";
  static const API_COMMON_NEW_OP_JOB_USER_SEARCH = "JobUserSearch";
  static const API_COMMON_NEW_OP_JOB_USER_DETAIL = "JobUserDetail";
}
