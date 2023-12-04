import 'package:eportal/application/global_application.dart';
import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/enum/role_type.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nhu_cau_viec_lam_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nhu_cau_viec_lam_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_chuyen_muc_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_co_quan_ban_hanh_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_doanh_nghiep_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_linh_vuc_van_ban_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_loai_van_ban_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_muc_luong_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_quan_huyen_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_trinh_do_repository.dart';
import 'package:eportal/screen/admin/home/home_page.dart' as admin;
import 'package:eportal/screen/anonymous/home/home_page.dart' as anonymous;
import 'package:eportal/screen/employer/home/home_page.dart' as employer;
import 'package:eportal/screen/worker//home/home_page.dart' as worker;
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_chuyen_muc_request.dart';
import '../../../../model/api/request/common_new/danh_sach_co_quan_ban_hanh_request.dart';
import '../../../../model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import '../../../../model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import '../../../../model/api/request/common_new/danh_sach_linh_vuc_van_ban_request.dart';
import '../../../../model/api/request/common_new/danh_sach_loai_van_ban_request.dart';
import '../../../../model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import '../../../../model/api/request/common_new/danh_sach_trinh_do_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_chuyen_muc_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_co_quan_ban_hanh_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_doanh_nghiep_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_linh_vuc_van_ban_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_loai_van_ban_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';
import '../../../../repository/common_new/danh_sach_gioi_tinh_repository.dart';
import '../../../../repository/common_new/danh_sach_kinh_nghiem_repository.dart';
import '../../../../repository/common_new/danh_sach_nhu_cau_viec_lam_repository.dart';
import '../../../../repository/common_new/danh_sach_tinh_tp_repository.dart';
import '../../../../style/app_text_style.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SplashPage extends BasePage {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage>
    with TickerProviderStateMixin {
  DangNhapBloc dangNhapBloc = DangNhapBloc();
  double currentData = 0;

  @override
  double currentPadding(BuildContext context) => 10;

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    loadingDataDefault();
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) {
    return BlocProvider(
      create: (_) => dangNhapBloc,
      child: BlocListener<DangNhapBloc, DataSingleState<DangNhapDataResponse>>(
        listener: (context, state) {
          switch (state.status) {
            case DataBlocStatus.init:
              break;
            case DataBlocStatus.loading:
              break;
            case DataBlocStatus.notFoundData:
              _skipPage(context);
              break;
            case DataBlocStatus.error:
              _skipPage(context);
              break;
            case DataBlocStatus.success:
              return handlerActionDataLogin(state.data);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    child: SizedBox(
                      height: 150,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/logoapp.png',
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Đang tải dữ liệu ${(currentData * 100).toInt()}%",
                    style: AppTextStyle.title
                        .copyWith(color: AppColor.colorOfIcon),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: LinearProgressIndicator(
                  minHeight: 15,
                  color: AppColor.colorOfIcon,
                  backgroundColor: Colors.grey,
                  value: currentData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _skipPage(BuildContext context) {
    endPercent();
    nextPageWithoutBack((context) => const anonymous.HomePage());
  }

  addPercent(double value) {
    setState(() {
      currentData += value;
    });
  }

  endPercent() {
    setState(() {
      currentData = 1;
    });
  }

  Future<void> loadProcess(double percent, Iterable<Future> futures) {
    return Future.wait(futures).then((value) => addPercent(percent));
  }

  Future<bool> checkAppRunFirstTime() async {
    bool? isFirstRunApp = GlobalApplication()
        .preferences
        ?.getBool(ApplicationConstant.FIRST_TIME_OPEN_APP);
    await GlobalApplication()
        .preferences
        ?.setBool(ApplicationConstant.FIRST_TIME_OPEN_APP, false);
    return isFirstRunApp ?? true;
  }

  Future<void> loadApplicationSetting() {
    return loadProcess(0.20, [
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]),
      getApplicationDocumentsDirectory()
          .then((value) => GlobalApplication().dirPath = value.path),
      PackageInfo.fromPlatform()
          .then((value) => GlobalApplication().packageInfo = value),
      SharedPreferences.getInstance()
          .then((value) => GlobalApplication().preferences = value)
    ]);
  }

  Future<void> loadApplicationConfig() {
    return loadProcess(0.70, [
      Future(() => GlobalApplication().userNameSaved = (GlobalApplication()
              .preferences!
              .getString(ApplicationConstant.USER_NAME))
          .replaceWhenNullOrWhiteSpace()),
      Future(() => GlobalApplication().isAutoLogin = (GlobalApplication()
              .preferences!
              .getBool(ApplicationConstant.AUTO_LOGIN)) ??
          false),
      Future(() => GlobalApplication().userPasswordSaved = (GlobalApplication()
              .preferences!
              .getString(ApplicationConstant.USER_PASSWORD))
          .replaceWhenNullOrWhiteSpace()),
      checkAppRunFirstTime()
          .then((value) => GlobalApplication().isFirstRunApp = value),
      callApiDanhSach(),
    ]);
  }

  Future<void> callApiDanhSach() {
    return Future.wait([
      DanhSachKinhNghiemRepository()
          .get(DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest())),
      DanhSachMucLuongRepository()
          .get(DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest())),
      DanhSachTinhTpRepository()
          .get(DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest())),
      DanhSachGioiTinhRepository()
          .get(DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest())),
      DanhSachNhuCauViecLamRepository().get(DanhSachNhuCauViecLamRequest(
          obj: DanhSachNhuCauViecLamDataRequest())),
      DanhSachMucLuongRepository()
          .get(DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest())),
      DanhSachKinhNghiemRepository()
          .get(DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest())),
      DanhSachGioiTinhRepository()
          .get(DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest())),
      DanhSachTrinhDoRepository()
          .get(DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest())),
      DanhSachLoaiVanBanRepository()
          .get(DanhSachLoaiVanBanRequest(obj: DanhSachLoaiVanBanDataRequest())),
      DanhSachCoQuanBanHanhRepository().get(DanhSachCoQuanBanHanhRequest(
          obj: DanhSachCoQuanBanHanhDataRequest())),
      DanhSachChuyenMucRepository()
          .get(DanhSachChuyenMucRequest(obj: DanhSachChuyenMucDataRequest())),
      DanhSachLinhVucVanBanRepository().get(DanhSachLinhVucVanBanRequest(
          obj: DanhSachLinhVucVanBanDataRequest())),
    ]);
  }

  Future<void> loadingDataDefault() {
    return loadApplicationSetting()
        .then((value) => loadApplicationConfig())
        .then((value) {
      if (!GlobalApplication().isAutoLogin ||
          GlobalApplication().userNameSaved.isNullOrWhiteSpace() ||
          GlobalApplication().userPasswordSaved.isNullOrWhiteSpace()) {
        _skipPage(context);
      } else {
        dangNhapBloc.add(DangNhapEvent(
            request: DangNhapRequest(
                obj: DangNhapDataRequest(
                    userName: GlobalApplication().userNameSaved,
                    passWord: GlobalApplication().userPasswordSaved))));
      }
    });
  }

  void handlerActionDataLogin(DangNhapDataResponse? data) {
    endPercent();
    GlobalApplication()
        .signIn(data, GlobalApplication().userNameSaved,
            GlobalApplication().userPasswordSaved)
        .then((value) {
      switch (GlobalApplication().roleType) {
        case RoleType.users:
          nextPageWithoutBack((context) => const worker.HomePage());
          break;
        case RoleType.bussiness:
          nextPageWithoutBack((context) => const employer.HomePage());
          break;
        case RoleType.cms:
          nextPageWithoutBack((context) => const admin.HomePage());
          break;
        case RoleType.anonymous:
          _skipPage(context);
          break;
      }
    });
  }
}
