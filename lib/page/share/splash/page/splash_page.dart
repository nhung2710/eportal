//
// Created by BlackRose on 26/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends BasePage {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage>{
  late DangNhapBloc dangNhapBloc;
  double currentData = 0;

  @override
  void initBloc() {
    dangNhapBloc = DangNhapBloc();
    loadingDataDefault();
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    dangNhapBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  double currentPadding(BuildContext context) => 10;

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {}

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
        child: Stack(
          children: [
            Center(
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
          ],
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
      DanhSachNhuCauRepository()
          .get(DanhSachNhuCauRequest(obj: DanhSachNhuCauDataRequest())),
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
      DanhSachViTriTuyenDungRepository().get(DanhSachViTriTuyenDungRequest(
          obj: DanhSachViTriTuyenDungDataRequest())),
      DanhSachTinhChatCongViecRepository().get(DanhSachTinhChatCongViecRequest(
          obj: DanhSachTinhChatCongViecDataRequest())),
    ]).then((value) => {}, onError: (ex) {
      print("Error");
      print(ex);
    });
  }

  Future<void> loadingDataDefault() {
    return loadApplicationSetting()
        .then((value) => loadApplicationConfig())
        .then((value) => Future.delayed(const Duration(minutes: 0)))
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