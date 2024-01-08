
//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_update_bloc.dart';
import 'package:eportal/bloc/admin/work_update_bloc.dart';
import 'package:eportal/event/admin/work_update_event.dart';
import 'package:eportal/model/api/request/admin/data/work_update_data_request.dart';
import 'package:eportal/model/api/request/admin/work_update_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_update_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_update_data_response.dart';
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
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/admin/job_user_update_event.dart';
import '../../../../extension/boolean_extension.dart';
import '../../../../model/api/request/admin/data/job_user_update_data_request.dart';
import '../../../../model/api/request/admin/job_user_update_request.dart';

class BusinessJobEditPage extends BasePageWidget {
  final WorkSearchByUserNameDataResponse data;

  const BusinessJobEditPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => BusinessJobEditPageState();
}

class BusinessJobEditPageState extends BasePageState<BusinessJobEditPage> {
  late WorkUpdateBloc workUpdateBloc;
  WorkUpdateEvent workUpdateEvent = WorkUpdateEvent(
      request: WorkUpdateRequest(obj: WorkUpdateDataRequest()));
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

  @override
  void initBloc() {
    workUpdateBloc = WorkUpdateBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workUpdateBloc.close();
  }

  @override
  void getMoreData() {}

  @override
  void initDataLoading() {}

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  void callApi() {
    workUpdateEvent.request.obj.tieuDe = keyBusinessJobBasicTabState.currentState?.tieuDeController.text;
    workUpdateEvent.request.obj.tinNoiBat = (keyBusinessJobBasicTabState.currentState?.tinNoiBat??false).toInt().toString();
    workUpdateEvent.request.obj.dauThongTinDN = (keyBusinessJobBasicTabState.currentState?.dauThongTinDN??false).toInt().toString();
    workUpdateEvent.request.obj.dangGap = (keyBusinessJobBasicTabState.currentState?.dangGap??false).toInt().toString();
    workUpdateEvent.request.obj.hanNopHoSo = keyBusinessJobBasicTabState.currentState?.hanNopHoSoController.text;
    workUpdateEvent.request.obj.dangTuNgay = keyBusinessJobBasicTabState.currentState?.dangTuNgayController.text;
    workUpdateEvent.request.obj.dangDenNgay = keyBusinessJobBasicTabState.currentState?.dangDenNgayController.text;
    workUpdateEvent.request.obj.hanNopHoSo = keyBusinessJobBasicTabState.currentState?.hanNopHoSoController.text;
    workUpdateEvent.request.obj.tinhTP = keyBusinessJobBasicTabState.currentState?.danhSachTinhTpDataResponse?.regionalID;

    workUpdateEvent.request.obj.mucLuong = keyBusinessJobGeneralTabState.currentState?.danhSachMucLuongDataResponse?.salaryID??"0";
    workUpdateEvent.request.obj.soLuong = keyBusinessJobGeneralTabState.currentState?.soLuongController.text;
    workUpdateEvent.request.obj.gioiTinh = keyBusinessJobGeneralTabState.currentState?.danhSachGioiTinhDataResponse?.id;
    workUpdateEvent.request.obj.kinhNghiem = keyBusinessJobGeneralTabState.currentState?.danhSachKinhNghiemDataResponse?.experienceID;
    workUpdateEvent.request.obj.doTuoi = keyBusinessJobGeneralTabState.currentState?.doTuoiController.text;
    workUpdateEvent.request.obj.chucVu = keyBusinessJobGeneralTabState.currentState?.danhSachChucVuDataResponse?.positionID;
    workUpdateEvent.request.obj.trinhdoCM = keyBusinessJobGeneralTabState.currentState?.danhSachTrinhDoDataResponse?.educationID;
    workUpdateEvent.request.obj.tinhChatCV = keyBusinessJobGeneralTabState.currentState?.danhSachTinhChatCongViecDataResponse?.typeOfID;
    workUpdateEvent.request.obj.viTriTuyenDung = keyBusinessJobGeneralTabState.currentState?.danhSachViTriTuyenDungDataResponse?.jobPlaceID;
    workUpdateEvent.request.obj.nganhNghe = keyBusinessJobGeneralTabState.currentState?.danhSachNganhNgheDataResponse?.careerID;
    workUpdateEvent.request.obj.thoiGianLV = keyBusinessJobGeneralTabState.currentState?.thoiGianLVController.text;

    workUpdateEvent.request.obj.mota = keyBusinessJobDescriptionTabState.currentState?.motaController.text;
    workUpdateEvent.request.obj.yeuCauCV = keyBusinessJobDescriptionTabState.currentState?.yeuCauHoSoController.text;
    workUpdateEvent.request.obj.yeuCauHoSo = keyBusinessJobDescriptionTabState.currentState?.yeuCauHoSoController.text;
    workUpdateEvent.request.obj.quyenLoi = keyBusinessJobDescriptionTabState.currentState?.quyenLoiController.text;

    workUpdateEvent.request.obj.tenNguoiLH = keyBusinessJobContractTabState.currentState?.tenNguoiLHController.text;
    workUpdateEvent.request.obj.diaChiNguoiLH = keyBusinessJobContractTabState.currentState?.diaChiNguoiLHController.text;
    workUpdateEvent.request.obj.dienThoaiNguoiLH = keyBusinessJobContractTabState.currentState?.dienThoaiNguoiLHController.text;
    workUpdateEvent.request.obj.ghiChu = keyBusinessJobContractTabState.currentState?.ghiChuController.text;


    workUpdateBloc.add(workUpdateEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => workUpdateBloc,
    child: BlocListener<WorkUpdateBloc,
        DataSingleState<WorkUpdateDataResponse>>(
      listener: (BuildContext context,
          DataSingleState<WorkUpdateDataResponse> state) {
        handlerActionDataSingleState<WorkUpdateDataResponse>(state,
                (obj) {
              showCenterMessage("Sửa tin tuyển dụng thành công")
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
                "Sửa tin tuyển dụng",
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
                  data: widget.data,
                ),
                "Thông tin tuyển dụng": BusinessJobGeneralTab(
                  key: keyBusinessJobGeneralTabState,
                  data: widget.data,
                ),
                "Thông tin yêu cầu": BusinessJobDescriptionTab(
                  key: keyBusinessJobDescriptionTabState,
                  data: widget.data,
                ),
                "Thông tin liên hệ": BusinessJobContractTab(
                  key: keyBusinessJobContractTabState,
                  data: widget.data,
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
                  text: 'Sửa',
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
