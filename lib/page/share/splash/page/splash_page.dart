//
// Created by BlackRose on 26/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/bloc/common_new/home_slide_list_bloc.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/enum/role_type.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/event/common_new/home_slide_list_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuyen_muc_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_co_quan_ban_hanh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_linh_vuc_van_ban_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_loai_van_ban_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nhu_cau_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_chat_cong_viec_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_trinh_do_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_vi_tri_tuyen_dung_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuyen_muc_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_co_quan_ban_hanh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_linh_vuc_van_ban_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_loai_van_ban_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nhu_cau_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_chat_cong_viec_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_vi_tri_tuyen_dung_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/home_slide_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/home_slide_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/home_slide_list_data_response.dart';
import 'package:eportal/page/anonymous/default/page/default_page.dart' as anonymous;
import 'package:eportal/page/cms/default/page/default_page.dart' as cms;
import 'package:eportal/page/business/default/page/default_page.dart' as business;
import 'package:eportal/page/users/default/page/default_page.dart' as users;
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/widget/default_image_network.dart';
import 'package:eportal/repository/common_new/danh_sach_chuyen_muc_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_co_quan_ban_hanh_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_gioi_tinh_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_kinh_nghiem_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_linh_vuc_van_ban_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_loai_van_ban_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_muc_luong_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_nhu_cau_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_tinh_chat_cong_viec_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_tinh_tp_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_trinh_do_repository.dart';
import 'package:eportal/repository/common_new/danh_sach_vi_tri_tuyen_dung_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/loading_process/loading_process.dart';
import '../../../base/page_widget/base_page_widget.dart';

class SplashPage extends BasePageWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage> {
  late DangNhapBloc dangNhapBloc;
  late HomeSlideListBloc homeSlideListBloc;
  GlobalKey<LoadingProcessState> keyLoadingProcessState =
      GlobalKey<LoadingProcessState>();
  HomeSlideListEvent homeSlideListEvent = HomeSlideListEvent(
      request: HomeSlideListRequest(obj: HomeSlideListDataRequest()));
  double currentData = 0;
  CarouselController _CarouselController = CarouselController();
  @override
  void initBloc() {
    homeSlideListBloc = HomeSlideListBloc();
    dangNhapBloc = DangNhapBloc();
  }

  @override
  void callApi() {
    homeSlideListBloc.add(homeSlideListEvent);
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeSlideListBloc.close();
    dangNhapBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    callApi();
    loadingDataDefault();
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
          child: BlocProvider(
            create: (_) => homeSlideListBloc,
            child: BlocListener<HomeSlideListBloc,
                DataMultiState<HomeSlideListDataResponse>>(
              listener: (BuildContext context, DataMultiState<HomeSlideListDataResponse> state) {  },
              child: BlocBuilder<HomeSlideListBloc,
                  DataMultiState<HomeSlideListDataResponse>>(
                builder: (BuildContext context, DataMultiState<HomeSlideListDataResponse> state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: state.status == DataBlocStatus.success && state.data.isNotEmpty ? Alignment.bottomCenter : Alignment.center,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 225
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                'assets/images/app.png',
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      state.status == DataBlocStatus.success && state.data.isNotEmpty ?  Expanded(child: buildSlide(state.data)) : Container(),
                      LoadingProcess(key: keyLoadingProcessState)
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  _skipPage(BuildContext context) {
    keyLoadingProcessState.currentState?.endLoading(txt: "Đang truy cập ...");
    nextPageWithoutBack((context) => anonymous.DefaultPage());
  }

  Future<void> loadProcess(double percent, Iterable<Future> futures) {
    return Future.wait(futures).then(
        (value) => keyLoadingProcessState.currentState?.updatePercent(percent),
        onError: (ex) {
      print("Error");
      print(ex);
    });
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
    return Future.wait([
      loadProcess(0.05, [
        SystemChrome.setPreferredOrientations(<DeviceOrientation>[
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown
        ])
      ]),
      loadProcess(0.05, [
        getApplicationDocumentsDirectory()
            .then((value) => GlobalApplication().dirPath = value.path)
      ]),
      loadProcess(0.05, [
        PackageInfo.fromPlatform()
            .then((value) => GlobalApplication().packageInfo = value)
      ]),
      loadProcess(0.05, [
        SharedPreferences.getInstance()
            .then((value) => GlobalApplication().preferences = value)
      ])
    ]);
  }

  Future<void> loadApplicationConfig() {
    return Future.wait([
      loadProcess(0.05, [
        Future(() => GlobalApplication().userNameSaved = (GlobalApplication()
                .preferences!
                .getString(ApplicationConstant.USER_NAME))
            .replaceWhenNullOrWhiteSpace())
      ]),
      loadProcess(0.05, [
        Future(() => GlobalApplication().isAutoLogin = (GlobalApplication()
                .preferences!
                .getBool(ApplicationConstant.AUTO_LOGIN)) ??
            false)
      ]),
      loadProcess(0.05, [
        Future(() => GlobalApplication().userPasswordSaved =
            (GlobalApplication()
                    .preferences!
                    .getString(ApplicationConstant.USER_PASSWORD))
                .replaceWhenNullOrWhiteSpace())
      ]),
      loadProcess(0.05, [
        checkAppRunFirstTime()
            .then((value) => GlobalApplication().isFirstRunApp = value)
      ]),
      callApiDanhSach()
    ]);
  }

  Future<void> callApiDanhSach() {
    return Future.wait([
      loadProcess(0.02, [
        DanhSachKinhNghiemRepository().get(
            DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachMucLuongRepository()
            .get(DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachTinhTpRepository()
            .get(DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachGioiTinhRepository()
            .get(DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachNhuCauRepository()
            .get(DanhSachNhuCauRequest(obj: DanhSachNhuCauDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachMucLuongRepository()
            .get(DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachKinhNghiemRepository().get(
            DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachGioiTinhRepository()
            .get(DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachTrinhDoRepository()
            .get(DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachLoaiVanBanRepository().get(
            DanhSachLoaiVanBanRequest(obj: DanhSachLoaiVanBanDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachCoQuanBanHanhRepository().get(DanhSachCoQuanBanHanhRequest(
            obj: DanhSachCoQuanBanHanhDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachChuyenMucRepository()
            .get(DanhSachChuyenMucRequest(obj: DanhSachChuyenMucDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachLinhVucVanBanRepository().get(DanhSachLinhVucVanBanRequest(
            obj: DanhSachLinhVucVanBanDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachViTriTuyenDungRepository().get(DanhSachViTriTuyenDungRequest(
            obj: DanhSachViTriTuyenDungDataRequest())),
      ]),
      loadProcess(0.02, [
        DanhSachTinhChatCongViecRepository().get(
            DanhSachTinhChatCongViecRequest(
                obj: DanhSachTinhChatCongViecDataRequest())),
      ]),
    ]);
  }

  Future<void> loadingDataDefault() {
    return loadApplicationSetting()
        .then((value) => loadApplicationConfig())
        .then((value) => Future.delayed(const Duration(seconds: 0)))
        .then((value) {
      if (!GlobalApplication().isAutoLogin ||
          GlobalApplication().userNameSaved.isNullOrWhiteSpace() ||
          GlobalApplication().userPasswordSaved.isNullOrWhiteSpace()) {
        _skipPage(context);
      } else {
        keyLoadingProcessState.currentState?.endLoading(txt: "Đang đăng nhập ...");
        dangNhapBloc.add(DangNhapEvent(
            request: DangNhapRequest(
                obj: DangNhapDataRequest(
                    userName: GlobalApplication().userNameSaved,
                    passWord: GlobalApplication().userPasswordSaved))));
      }
    });
  }

  void handlerActionDataLogin(DangNhapDataResponse? data) {
    GlobalApplication()
        .signIn(data, GlobalApplication().userNameSaved,
            GlobalApplication().userPasswordSaved)
        .then((value) {
      switch (GlobalApplication().roleType) {
        case RoleType.users:
          keyLoadingProcessState.currentState?.endLoading(txt: "Đăng nhập thành công");
          nextPageWithoutBack((context) => users.DefaultPage());
          break;
        case RoleType.bussiness:
          keyLoadingProcessState.currentState?.endLoading(txt: "Đăng nhập thành công");
          nextPageWithoutBack((context) => business.DefaultPage());
          break;
        case RoleType.cms:
          keyLoadingProcessState.currentState?.endLoading(txt: "Đăng nhập thành công");
          nextPageWithoutBack((context) => cms.DefaultPage());
          break;
        case RoleType.anonymous:
          _skipPage(context);
          break;
      }
    });
  }
  Widget buildSlide(List<HomeSlideListDataResponse> data) => Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: const EdgeInsets.all(10),
      child: CarouselSlider(
        disableGesture: true,
        options: CarouselOptions(
          aspectRatio: 16/9,
          viewportFraction: 1,
          animateToClosest: true,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          disableCenter: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 3),
          autoPlayCurve: Curves.decelerate,
          enlargeCenterPage: true,
          enlargeFactor: 10,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          scrollDirection: Axis.horizontal,
        ),
        items: data.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shadowColor: AppColor.colorOfIcon,
                surfaceTintColor: Colors.transparent,
                borderOnForeground: false,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        color: AppColor.colorOfDrawer,
                        width: 0.05),
                    borderRadius:
                    BorderRadius.all(Radius.circular(5))),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(5.0)),
                    child: DefaultImageNetwork(
                        imageUrl: item.avatar.getImageUrl(),)),
              );
            },
          );
        }).toList(),
      
        carouselController: _CarouselController,
      ),
    ),
  );
}
