
//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_add_bloc.dart';
import 'package:eportal/bloc/admin/work_add_bloc.dart';
import 'package:eportal/event/admin/job_user_add_event.dart';
import 'package:eportal/event/admin/work_add_event.dart';
import 'package:eportal/model/api/request/admin/data/work_add_data_request.dart';
import 'package:eportal/model/api/request/admin/work_add_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_add_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_add_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/business/business_job_share/tab/business_job_basic_tab.dart';
import 'package:eportal/page/business/business_job_share/tab/business_job_contract_tab.dart';
import 'package:eportal/page/business/business_job_share/tab/business_job_description_tab.dart';
import 'package:eportal/page/business/business_job_share/tab/business_job_general_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_basic_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_career_goals_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_field_skills_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_general_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_level_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_work_experience_tab.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../extension/boolean_extension.dart';
import '../../../../model/api/request/admin/data/job_user_add_data_request.dart';
import '../../../../model/api/request/admin/job_user_add_request.dart';
import '../../../widget/default_capcha_text_form_field.dart';

class BusinessJobAddPage extends BasePageWidget {
  const BusinessJobAddPage({super.key});

  @override
  State<StatefulWidget> createState() => BusinessJobAddPageState();
}

class BusinessJobAddPageState extends BasePageState<BusinessJobAddPage> {
  GlobalKey<CustomTabViewState> keyCustomTabViewState =
  GlobalKey<CustomTabViewState>();
  final GlobalKey<BusinessJobBasicTabState> keyBusinessJobBasicTabState =
  GlobalKey<BusinessJobBasicTabState>();
  final GlobalKey<BusinessJobGeneralTabState> keyBusinessJobGeneralTabState =
  GlobalKey<BusinessJobGeneralTabState>();
  final GlobalKey<BusinessJobDescriptionTabState> keyBusinessJobDescriptionTabState =
  GlobalKey<BusinessJobDescriptionTabState>();
  final GlobalKey<BusinessJobContractTabState> keyBusinessJobContractTabState =
  GlobalKey<BusinessJobContractTabState>();
  late WorkAddBloc workAddBloc;
  WorkAddEvent workAddEvent =
  WorkAddEvent(request: WorkAddRequest(obj: WorkAddDataRequest()));

  @override
  void initBloc() {
    workAddBloc = WorkAddBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workAddBloc.close();
  }

  @override
  void getMoreData() {}

  @override
  void initDataLoading() {}

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  void callApi() {
    workAddEvent.request.obj.tieuDe = keyBusinessJobBasicTabState.currentState?.tieuDeController.text;
    workAddEvent.request.obj.tinNoiBat = (keyBusinessJobBasicTabState.currentState?.tinNoiBat??false).toInt().toString();
    workAddEvent.request.obj.dauThongTinDN = (keyBusinessJobBasicTabState.currentState?.dauThongTinDN??false).toInt().toString();
    workAddEvent.request.obj.dangGap = (keyBusinessJobBasicTabState.currentState?.dangGap??false).toInt().toString();
    workAddEvent.request.obj.hanNopHoSo = keyBusinessJobBasicTabState.currentState?.hanNopHoSoController.text;
    workAddEvent.request.obj.dangTuNgay = keyBusinessJobBasicTabState.currentState?.dangTuNgayController.text;
    workAddEvent.request.obj.dangDenNgay = keyBusinessJobBasicTabState.currentState?.dangDenNgayController.text;
    workAddEvent.request.obj.hanNopHoSo = keyBusinessJobBasicTabState.currentState?.hanNopHoSoController.text;
    workAddEvent.request.obj.tinhTP = keyBusinessJobBasicTabState.currentState?.danhSachTinhTpDataResponse?.regionalID;

    workAddEvent.request.obj.mucLuong = keyBusinessJobGeneralTabState.currentState?.danhSachMucLuongDataResponse?.salaryID??"0";
    workAddEvent.request.obj.soLuong = keyBusinessJobGeneralTabState.currentState?.soLuongController.text;
    workAddEvent.request.obj.gioiTinh = keyBusinessJobGeneralTabState.currentState?.danhSachGioiTinhDataResponse?.id;
    workAddEvent.request.obj.kinhNghiem = keyBusinessJobGeneralTabState.currentState?.danhSachKinhNghiemDataResponse?.experienceID;
    workAddEvent.request.obj.doTuoi = keyBusinessJobGeneralTabState.currentState?.doTuoiController.text;
    workAddEvent.request.obj.chucVu = keyBusinessJobGeneralTabState.currentState?.danhSachChucVuDataResponse?.positionID;
    workAddEvent.request.obj.trinhdoCM = keyBusinessJobGeneralTabState.currentState?.danhSachTrinhDoDataResponse?.educationID;
    workAddEvent.request.obj.tinhChatCV = keyBusinessJobGeneralTabState.currentState?.danhSachTinhChatCongViecDataResponse?.typeOfID;
    workAddEvent.request.obj.viTriTuyenDung = keyBusinessJobGeneralTabState.currentState?.danhSachViTriTuyenDungDataResponse?.jobPlaceID;
    workAddEvent.request.obj.nganhNghe = keyBusinessJobGeneralTabState.currentState?.danhSachNganhNgheDataResponse?.careerID;
    workAddEvent.request.obj.thoiGianLV = keyBusinessJobGeneralTabState.currentState?.thoiGianLVController.text;

    workAddEvent.request.obj.mota = keyBusinessJobDescriptionTabState.currentState?.motaController.text;
    workAddEvent.request.obj.yeuCauCV = keyBusinessJobDescriptionTabState.currentState?.yeuCauHoSoController.text;
    workAddEvent.request.obj.yeuCauHoSo = keyBusinessJobDescriptionTabState.currentState?.yeuCauHoSoController.text;
    workAddEvent.request.obj.quyenLoi = keyBusinessJobDescriptionTabState.currentState?.quyenLoiController.text;

    workAddEvent.request.obj.tenNguoiLH = keyBusinessJobContractTabState.currentState?.tenNguoiLHController.text;
    workAddEvent.request.obj.diaChiNguoiLH = keyBusinessJobContractTabState.currentState?.diaChiNguoiLHController.text;
    workAddEvent.request.obj.dienThoaiNguoiLH = keyBusinessJobContractTabState.currentState?.dienThoaiNguoiLHController.text;
    workAddEvent.request.obj.ghiChu = keyBusinessJobContractTabState.currentState?.ghiChuController.text;


    workAddBloc.add(workAddEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => workAddBloc,
    child: BlocListener<WorkAddBloc,
        DataSingleState<WorkAddDataResponse>>(
      listener: (BuildContext context,
          DataSingleState<WorkAddDataResponse> state) {
        handlerActionDataSingleState<WorkAddDataResponse>(state, (obj) {
          showCenterMessage("Tạo tin tuyển dụng thành công")
              .then((value) => backPage(true));
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Tạo tin tuyển dụng",
                style: AppTextStyle.titlePage.copyWith(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    color: AppColor.colorOfIconActive),
              ),
            ),
          ),
          Expanded(
            child: CustomTabView(
              key: keyCustomTabViewState,
              tabViews: {
                "Thông tin tin tuyển dụng việc làm":
                BusinessJobBasicTab(
                  key: keyBusinessJobBasicTabState,
                ),
                "Thông tin tuyển dụng": BusinessJobGeneralTab(
                  key: keyBusinessJobGeneralTabState,
                ),
                "Thông tin yêu cầu": BusinessJobDescriptionTab(
                  key: keyBusinessJobDescriptionTabState,
                ),
                "Thông tin liên hệ": BusinessJobContractTab(
                  key: keyBusinessJobContractTabState,
                ),
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: DefaultCapchaTextFormField(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => submitForm(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.all(10),
                child: DefaultButton(
                  text: 'Tạo',
                  onPressed: () => submitForm(),
                )),
          ),
        ],
      ),
    ),
  );

  bool _validPage(BuildContext context, BasePageState? state, int page) {
    if (state != null) {
      return state.isValid();
    }
    keyCustomTabViewState.currentState?.nextPage(page);
    return false;
  }

  void submitForm() {
    if (isValid()) {
      if (_validPage(context, keyBusinessJobBasicTabState.currentState,0)) {
        if (_validPage(context, keyBusinessJobGeneralTabState.currentState,1)) {
          if (_validPage(context, keyBusinessJobDescriptionTabState.currentState,2)) {
            if (_validPage(
                context, keyBusinessJobContractTabState.currentState,3)) {
              callApi();
            }
          }
        }
      }
    }
  }
}
