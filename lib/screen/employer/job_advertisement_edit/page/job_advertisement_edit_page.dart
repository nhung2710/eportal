import 'package:eportal/event/admin/work_update_event.dart';
import 'package:eportal/model/api/request/admin/data/work_update_data_request.dart';
import 'package:eportal/model/api/request/admin/work_update_request.dart';
import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_update_data_response.dart';
import 'package:eportal/screen/employer/job_advertisement_edit/tab/job_advertisement_edit_basic_tab.dart';
import 'package:eportal/screen/employer/job_advertisement_edit/tab/job_advertisement_edit_contract_tab.dart';
import 'package:eportal/screen/employer/job_advertisement_edit/tab/job_advertisement_edit_description_tab.dart';
import 'package:eportal/screen/employer/job_advertisement_edit/tab/job_advertisement_edit_general_tab.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/admin/work_update_bloc.dart';
import '../../../../extension/boolean_extension.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobAdvertisementEditPage extends BasePage {
  WorkSearchByUserNameDataResponse data;

  JobAdvertisementEditPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _JobAdvertisementEditPageState();
}

class _JobAdvertisementEditPageState
    extends BasePageState<JobAdvertisementEditPage> {
  GlobalKey<CustomTabViewState> keyCustomTabViewState =
      GlobalKey<CustomTabViewState>();
  GlobalKey<JobAdvertisementEditBasicTabState>
      keyJobAdvertisementEditBasicTabState =
      GlobalKey<JobAdvertisementEditBasicTabState>();
  GlobalKey<JobAdvertisementEditGeneralTabState>
      keyJobAdvertisementEditGeneralTabState =
      GlobalKey<JobAdvertisementEditGeneralTabState>();
  GlobalKey<JobAdvertisementEditContractTabState>
      keyJobAdvertisementEditContractTabState =
      GlobalKey<JobAdvertisementEditContractTabState>();
  GlobalKey<JobAdvertisementEditDescriptionTabState>
      keyJobAdvertisementEditDescriptionTabState =
      GlobalKey<JobAdvertisementEditDescriptionTabState>();
  late WorkUpdateBloc workUpdateBloc;

  @override
  void initBloc() {
    workUpdateBloc = WorkUpdateBloc();
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workUpdateBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {}

  @override
  String getPageTitle(BuildContext context) => "Sửa tin tuyển dụng";

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => workUpdateBloc,
        child: BlocListener<WorkUpdateBloc,
            DataSingleState<WorkUpdateDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<WorkUpdateDataResponse> state) {
            handlerActionDataSingleState<WorkUpdateDataResponse>(state, (obj) {
              showCenterMessage("Sửa tin tuyển dụng thành công")
                  .then((value) => backPage());
            });
          },
          child: Column(
            children: [
              Expanded(
                child: CustomTabView(
                  key: keyCustomTabViewState,
                  tabViews: {
                    "Thông tin tin tuyển dụng việc làm":
                        JobAdvertisementEditBasicTab(
                      key: keyJobAdvertisementEditBasicTabState,
                    ),
                    "Thông tin tuyển dụng": JobAdvertisementEditGeneralTab(
                      key: keyJobAdvertisementEditGeneralTabState,
                    ),
                    "Thông tin yêu cầu": JobAdvertisementEditDescriptionTab(
                      key: keyJobAdvertisementEditDescriptionTabState,
                    ),
                    "Thông tin liên hệ": JobAdvertisementEditContractTab(
                      key: keyJobAdvertisementEditContractTabState,
                    ),
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CapchaInput(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) => _send(context),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: DefaultButton(
                    text: 'Sửa',
                    onPressed: () => _send(context),
                  )),
            ],
          ),
        ),
      );

  _validPage(BuildContext context, BasePageState? state, int page) {
    if (state?.isValid() == true) {
      return true;
    } else {
      keyCustomTabViewState.currentState?.nextPage(page);
      return false;
    }
  }

  _send(BuildContext context) {
    if (_validBeforeSend(context)) {
      workUpdateBloc.add(WorkUpdateEvent(
          request: WorkUpdateRequest(
              obj: WorkUpdateDataRequest(
        work_ID: widget.data.workID,
        gioiTinh: keyJobAdvertisementEditGeneralTabState
            .currentState?.widget.danhSachGioiTinhDataResponse?.id,
        tieuDe: keyJobAdvertisementEditBasicTabState
            .currentState?.tieuDeController.text,
        doTuoi: keyJobAdvertisementEditGeneralTabState
            .currentState?.doTuoiController.text,
        soLuong: keyJobAdvertisementEditGeneralTabState
            .currentState?.soLuongController.text,
        hanNopHoSo: keyJobAdvertisementEditBasicTabState
            .currentState?.hanNopHoSoController.text,
        dangTuNgay: keyJobAdvertisementEditBasicTabState
            .currentState?.dangTuNgayController.text,
        dangDenNgay: keyJobAdvertisementEditBasicTabState
            .currentState?.dangDenNgayController.text,
        tinhTP: keyJobAdvertisementEditBasicTabState
            .currentState?.widget.danhSachTinhTpDataResponse?.regionalID,
        tinNoiBat: (keyJobAdvertisementEditBasicTabState
                .currentState?.widget.tinNoiBat)
            .toInt()
            .toString(),
        dauThongTinDN: (keyJobAdvertisementEditBasicTabState
                .currentState?.widget.dauThongTinDN)
            .toInt()
            .toString(),
        dangGap:
            (keyJobAdvertisementEditBasicTabState.currentState?.widget.dangGap)
                .toInt()
                .toString(),
        thoiGianLV: keyJobAdvertisementEditGeneralTabState
            .currentState?.thoiGianLVController.text,
        chucVu: keyJobAdvertisementEditGeneralTabState
            .currentState?.widget.danhSachChucVuDataResponse?.id,
        mucLuong: keyJobAdvertisementEditGeneralTabState
            .currentState?.widget.danhSachMucLuongDataResponse?.salaryID,
        kinhNghiem: keyJobAdvertisementEditGeneralTabState
            .currentState?.widget.danhSachKinhNghiemDataResponse?.experienceID,
        trinhdoCM: keyJobAdvertisementEditGeneralTabState
            .currentState?.widget.danhSachKinhNghiemDataResponse?.experienceID,
        tinhChatCV: keyJobAdvertisementEditGeneralTabState.currentState?.widget
            .danhSachTinhChatCongViecDataResponse?.typeOfID,
        nganhNghe: keyJobAdvertisementEditGeneralTabState
            .currentState?.widget.danhSachNganhNgheDataResponse?.careerID,
        viTriTuyenDung: keyJobAdvertisementEditGeneralTabState.currentState
            ?.widget.danhSachViTriTuyenDungDataResponse?.jobPlaceID,
        mota: keyJobAdvertisementEditDescriptionTabState
            .currentState?.motaController.text,
        yeuCauCV: keyJobAdvertisementEditDescriptionTabState
            .currentState?.yeuCauCVController.text,
        yeuCauHoSo: keyJobAdvertisementEditDescriptionTabState
            .currentState?.yeuCauHoSoController.text,
        quyenLoi: keyJobAdvertisementEditDescriptionTabState
            .currentState?.quyenLoiController.text,
        ghiChu: keyJobAdvertisementEditContractTabState
            .currentState?.ghiChuController.text,
        tenNguoiLH: keyJobAdvertisementEditContractTabState
            .currentState?.tenNguoiLHController.text,
        diaChiNguoiLH: keyJobAdvertisementEditContractTabState
            .currentState?.tenNguoiLHController.text,
        dienThoaiNguoiLH: keyJobAdvertisementEditContractTabState
            .currentState?.dienThoaiNguoiLHController.text,
        emailNguoiLH: keyJobAdvertisementEditContractTabState
            .currentState?.emailNguoiLHController.text,
      ))));
    }
  }

  bool _validBeforeSend(BuildContext context) {
    if (_validPage(
            context, keyJobAdvertisementEditBasicTabState.currentState, 0) &&
        _validPage(
            context, keyJobAdvertisementEditGeneralTabState.currentState, 1) &&
        _validPage(context,
            keyJobAdvertisementEditDescriptionTabState.currentState, 2) &&
        _validPage(
            context, keyJobAdvertisementEditContractTabState.currentState, 3)) {
      return true;
    }
    return false;
  }
}
