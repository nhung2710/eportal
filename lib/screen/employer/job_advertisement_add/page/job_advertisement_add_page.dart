import 'package:eportal/bloc/admin/work_add_bloc.dart';
import 'package:eportal/model/api/response/admin/data/work_add_data_response.dart';
import 'package:eportal/screen/employer/job_advertisement_add/tab/job_advertisement_add_contract_tab.dart';
import 'package:eportal/screen/employer/job_advertisement_add/tab/job_advertisement_add_description_tab.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/admin/work_add_event.dart';
import '../../../../extension/boolean_extension.dart';
import '../../../../model/api/request/admin/data/work_add_data_request.dart';
import '../../../../model/api/request/admin/work_add_request.dart';
import '../../../../widget/tab/custom_tab_view.dart';
import '../tab/job_advertisement_add_basic_tab.dart';
import '../tab/job_advertisement_add_general_tab.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobAdvertisementAddPage extends BasePage {
  JobAdvertisementAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _JobAdvertisementAddPageState();
}

class _JobAdvertisementAddPageState
    extends BasePageState<JobAdvertisementAddPage> {
  GlobalKey<CustomTabViewState> keyCustomTabViewState =
      GlobalKey<CustomTabViewState>();
  GlobalKey<JobAdvertisementAddBasicTabState>
      keyJobAdvertisementAddBasicTabState =
      GlobalKey<JobAdvertisementAddBasicTabState>();
  GlobalKey<JobAdvertisementAddGeneralTabState>
      keyJobAdvertisementAddGeneralTabState =
      GlobalKey<JobAdvertisementAddGeneralTabState>();
  GlobalKey<JobAdvertisementAddContractTabState>
      keyJobAdvertisementAddContractTabState =
      GlobalKey<JobAdvertisementAddContractTabState>();
  GlobalKey<JobAdvertisementAddDescriptionTabState>
      keyJobAdvertisementAddDescriptionTabState =
      GlobalKey<JobAdvertisementAddDescriptionTabState>();
  late WorkAddBloc workAddBloc;

  @override
  void initBloc() {
    workAddBloc = WorkAddBloc();
  }

  @override
  void initDataLoading() {}

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workAddBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  String getPageTitle(BuildContext context) => "Tạo tin tuyển dụng";

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => workAddBloc,
        child: BlocListener<WorkAddBloc, DataSingleState<WorkAddDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<WorkAddDataResponse> state) {
            handlerActionDataSingleState<WorkAddDataResponse>(state, (obj) {
              showCenterMessage("Tạo tin tuyển dụng thành công")
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
                        JobAdvertisementAddBasicTab(
                      key: keyJobAdvertisementAddBasicTabState,
                    ),
                    "Thông tin tuyển dụng": JobAdvertisementAddGeneralTab(
                      key: keyJobAdvertisementAddGeneralTabState,
                    ),
                    "Thông tin yêu cầu": JobAdvertisementAddDescriptionTab(
                      key: keyJobAdvertisementAddDescriptionTabState,
                    ),
                    "Thông tin liên hệ": JobAdvertisementAddContractTab(
                      key: keyJobAdvertisementAddContractTabState,
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
                    text: 'Tạo',
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
      workAddBloc.add(WorkAddEvent(
          request: WorkAddRequest(
              obj: WorkAddDataRequest(
        gioiTinh: keyJobAdvertisementAddGeneralTabState
            .currentState?.widget.danhSachGioiTinhDataResponse?.id,
        tieuDe: keyJobAdvertisementAddBasicTabState
            .currentState?.tieuDeController.text,
        doTuoi: keyJobAdvertisementAddGeneralTabState
            .currentState?.doTuoiController.text,
        soLuong: keyJobAdvertisementAddGeneralTabState
            .currentState?.soLuongController.text,
        hanNopHoSo: keyJobAdvertisementAddBasicTabState
            .currentState?.hanNopHoSoController.text,
        dangTuNgay: keyJobAdvertisementAddBasicTabState
            .currentState?.dangTuNgayController.text,
        dangDenNgay: keyJobAdvertisementAddBasicTabState
            .currentState?.dangDenNgayController.text,
        tinhTP: keyJobAdvertisementAddBasicTabState
            .currentState?.widget.danhSachTinhTpDataResponse?.regionalID,
        tinNoiBat:
            (keyJobAdvertisementAddBasicTabState.currentState?.widget.tinNoiBat)
                .toInt()
                .toString(),
        dauThongTinDN: (keyJobAdvertisementAddBasicTabState
                .currentState?.widget.dauThongTinDN)
            .toInt()
            .toString(),
        dangGap:
            (keyJobAdvertisementAddBasicTabState.currentState?.widget.dangGap)
                .toInt()
                .toString(),
        thoiGianLV: keyJobAdvertisementAddGeneralTabState
            .currentState?.thoiGianLVController.text,
        chucVu: keyJobAdvertisementAddGeneralTabState
            .currentState?.widget.danhSachChucVuDataResponse?.id,
        mucLuong: keyJobAdvertisementAddGeneralTabState
            .currentState?.widget.danhSachMucLuongDataResponse?.salaryID,
        kinhNghiem: keyJobAdvertisementAddGeneralTabState
            .currentState?.widget.danhSachKinhNghiemDataResponse?.experienceID,
        trinhdoCM: keyJobAdvertisementAddGeneralTabState
            .currentState?.widget.danhSachKinhNghiemDataResponse?.experienceID,
        tinhChatCV: keyJobAdvertisementAddGeneralTabState.currentState?.widget
            .danhSachTinhChatCongViecDataResponse?.typeOfID,
        nganhNghe: keyJobAdvertisementAddGeneralTabState
            .currentState?.widget.danhSachNganhNgheDataResponse?.careerID,
        viTriTuyenDung: keyJobAdvertisementAddGeneralTabState.currentState
            ?.widget.danhSachViTriTuyenDungDataResponse?.jobPlaceID,
        mota: keyJobAdvertisementAddDescriptionTabState
            .currentState?.motaController.text,
        yeuCauCV: keyJobAdvertisementAddDescriptionTabState
            .currentState?.yeuCauCVController.text,
        yeuCauHoSo: keyJobAdvertisementAddDescriptionTabState
            .currentState?.yeuCauHoSoController.text,
        quyenLoi: keyJobAdvertisementAddDescriptionTabState
            .currentState?.quyenLoiController.text,
        ghiChu: keyJobAdvertisementAddContractTabState
            .currentState?.ghiChuController.text,
        tenNguoiLH: keyJobAdvertisementAddContractTabState
            .currentState?.tenNguoiLHController.text,
        diaChiNguoiLH: keyJobAdvertisementAddContractTabState
            .currentState?.tenNguoiLHController.text,
        dienThoaiNguoiLH: keyJobAdvertisementAddContractTabState
            .currentState?.dienThoaiNguoiLHController.text,
        emailNguoiLH: keyJobAdvertisementAddContractTabState
            .currentState?.emailNguoiLHController.text,
      ))));
    }
  }

  bool _validBeforeSend(BuildContext context) {
    if (_validPage(
            context, keyJobAdvertisementAddBasicTabState.currentState, 0) &&
        _validPage(
            context, keyJobAdvertisementAddGeneralTabState.currentState, 1) &&
        _validPage(context,
            keyJobAdvertisementAddDescriptionTabState.currentState, 2) &&
        _validPage(
            context, keyJobAdvertisementAddContractTabState.currentState, 3)) {
      return true;
    }
    return false;
  }
}
