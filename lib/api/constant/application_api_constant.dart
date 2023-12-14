class ApplicationApiConstant {
  static const kBASE_AUTH_HEADER_USER_LOGIN = 'eportal';
  static const kBASE_AUTH_HEADER_PASSWORD = 'CT03-M14IC-PO22SE-0SOFT4-A0P1J';
  static const kBASE_URI = 'http://work.eportal.top/';
  static const kBASE_URI_MEDIA = 'http://file.eportal.top/';
  static const kBASE_API_URI = '$kBASE_URI/api';
  static const kBASE_API_APP_URI = '$kBASE_URI/api/app';
  static const kAPI_COMMON_NEW = '$kBASE_API_APP_URI/commonnew.asmx';
  static const kAPI_ADMIN = '$kBASE_API_APP_URI/admin.asmx';
  static const kAPI_ADMIN_OP = '$kAPI_ADMIN?op=';
  static const kAPI_COMMON_NEW_OP = '$kAPI_COMMON_NEW?op=';
  static const kAPI_SUCCESS_CODE = 2;
  static const kTIME_CACHE_LOW_DEFAULT = 60 * 5;
  static const kTIME_CACHE_MEDIUM_DEFAULT = kTIME_CACHE_LOW_DEFAULT * 6;
  static const kTIME_CACHE_HIGH_DEFAULT = kTIME_CACHE_MEDIUM_DEFAULT * 2;
  static const kTIME_CACHE_DEFAULT = kTIME_CACHE_HIGH_DEFAULT * 6;
  static const kAPI_RESULT = 'Result';
  static const kAPI_COMMON_NEW_OP_HOME_WORKS_LIST = "HomeWorksList";
  static const kAPI_COMMON_NEW_OP_HOME_NEWS_LIST = "HomeNewsList";
  static const kAPI_COMMON_NEW_OP_HOME_SLIDE_LIST = "HomeSlideList";
  static const kAPI_COMMON_NEW_OP_HOME_JOB_USER_LIST = "HomeJobUserList";
  static const kAPI_COMMON_NEW_OP_HOME_BUSINESS_LIST = "HomeBusinessList";
  static const kAPI_COMMON_NEW_OP_HOME_DOCUMENT_LIST = "HomeDocumentList";
  static const kAPI_COMMON_NEW_OP_HOME_ADVERTISE_LIST = "HomeAdvertiseList";
  static const kAPI_COMMON_NEW_OP_GIOI_THIEU_TRUNG_TAM = "GioiThieuTrungTam";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_TINH_TP = "DanhSachTinhTP";
  static const kAPI_COMMON_NEW_OP_TEN_TINH_TP = "TenTinhTP";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_QUAN_HUYEN = "DanhSachQuanHuyen";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_DOANH_NGHIEP =
      "DanhSachDoanhNghiep";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_MUC_LUONG = "DanhSachMucLuong";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_KINH_NGHIEM = "DanhSachKinhNghiem";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_GIOI_TINH = "DanhSachGioiTinh";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_TRINH_DO = "DanhSachTrinhDo";
  static const kAPI_COMMON_NEW_OP_WORK_SEARCH = "WorkSearch";
  static const kAPI_COMMON_NEW_OP_WORK_DETAIL = "WorkDetail";
  static const kAPI_COMMON_NEW_OP_NEWS_SEARCH = "NewsSearch";
  static const kAPI_COMMON_NEW_OP_NEWS_DETAIL = "NewsDetail";
  static const kAPI_COMMON_NEW_OP_JOB_USER_SEARCH = "JobUserSearch";
  static const kAPI_COMMON_NEW_OP_JOB_USER_DETAIL = "JobUserDetail";
  static const kAPI_COMMON_NEW_OP_FAQ_QUESTION_SEARCH = "FAQQuestionSearch";
  static const kAPI_COMMON_NEW_OP_FAQ_ADD_QUESTION = "FAQAddQuestion";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_LINH_VUC_VAN_BAN =
      "DanhSachLinhVucVanBan";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_LOAI_VAN_BAN = "DanhSachLoaiVanBan";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_CO_QUAN_BAN_HANH =
      "DanhSachCoQuanBanHanh";
  static const kAPI_COMMON_NEW_OP_DOCUMENT_LIST = "DocumentList";
  static const kAPI_COMMON_NEW_OP_VIDEO_LIST = "VideoList";
  static const kAPI_COMMON_NEW_OP_VIDEO_DETAIL = "VideoDetail";
  static const kAPI_COMMON_NEW_OP_ALBUM_LIST = "AlbumList";
  static const kAPI_COMMON_NEW_OP_ALBUM_DETAIL = "AlbumDetail";
  static const kAPI_COMMON_NEW_OP_DANG_NHAP = "DangNhap";
  static const kAPI_COMMON_NEW_OP_DANG_KY = "DangKy";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_CHUYEN_MUC = "DanhSachChuyenMuc";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_CHUC_VU = "DanhSachChucVu";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_NHU_CAU = "DanhSachNhuCau";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_NGANH_NGHE = "DanhSachNganhNghe";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_VI_TRI_TUYEN_DUNG =
      "DanhSachViTriTuyenDung";
  static const kAPI_COMMON_NEW_OP_DANH_SACH_TINH_CHAT_CONG_VIEC =
      "DanhSachTinhChatCongViec";

  static const kAPI_ADMIN_OP_USER_UPDATE = "UserUpdate";
  static const kAPI_ADMIN_OP_JOB_USER_ADD = "JobUserAdd";
  static const kAPI_ADMIN_OP_JOB_USER_UPDATE = "JobUserUpdate";
  static const kAPI_ADMIN_OP_JOB_USER_LIST = "JobUserUpdateList";
  static const kAPI_ADMIN_OP_JOB_USER_LIST_BY_USER_NAME =
      "JobUserListByUserName";
  static const kAPI_ADMIN_OP_JOB_USER_REFER_UPDATE = "JobUserReferUpdate";
  static const kAPI_ADMIN_OP_JOB_USER_REFER_ADD = "JobUserReferAdd";
  static const kAPI_ADMIN_OP_JOB_USER_REFER_DELETE = "JobUserReferDelete";
  static const kAPI_ADMIN_OP_JOB_USER_REFER_LIST = "JobUserReferList";
  static const kAPI_ADMIN_OP_JOB_USER_HISTORY_LIST = "JobUserHistoryList";
  static const kAPI_ADMIN_OP_WORK_VIEW_LIST = "WorkViewList";
  static const kAPI_ADMIN_OP_WORK_SAVE_LIST = "WorkSaveList";
  static const kAPI_ADMIN_OP_WORK_SEND_LIST = "WorkSendList";
  static const kAPI_ADMIN_OP_JOB_USER_SEND = "JobUserSend";
  static const kAPI_ADMIN_OP_WORK_ADD = "WorkAdd";
  static const kAPI_ADMIN_OP_WORK_UPDATE = "WorkUpdate";
  static const kAPI_ADMIN_OP_WORK_SEARCH_BY_USER_NAME = "WorkSearchByUserName";
  static const kAPI_ADMIN_OP_WORK_DELETE = "WorkDelete";
  static const kAPI_ADMIN_OP_PROFILE_SAVE = "ProfileSave";
  static const kAPI_ADMIN_OP_PROFILE_SAVE_LIST = "ProfileSaveList";
  static const kAPI_ADMIN_OP_PROFILE_VIEW_LIST = "ProfileViewList";
  static const kAPI_ADMIN_OP_PROFILE_SEND_LIST = "ProfileSendList";
  static const kAPI_ADMIN_OP_PROFILE_BLACK_LIST = "ProfileBlackList";
}
