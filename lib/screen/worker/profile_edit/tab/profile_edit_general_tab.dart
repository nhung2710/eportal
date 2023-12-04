import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuc_vu_event.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuc_vu_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuc_vu_data_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_chuc_vu_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuc_vu_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_trinh_do_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/danh_sach_chuc_vu_bloc.dart';
import '../../../../bloc/common_new/danh_sach_nhu_cau_viec_lam_bloc.dart';
import '../../../../event/common_new/danh_sach_nhu_cau_viec_lam_event.dart';
import '../../../../event/common_new/danh_sach_trinh_do_event.dart';
import '../../../../extension/dateTime_extension.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_nhu_cau_viec_lam_request.dart';
import '../../../../model/api/request/common_new/danh_sach_trinh_do_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_nhu_cau_viec_lam_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';
import '../../../../model/api/response/common_new/data/danh_sach_nhu_cau_viec_lam_data_response.dart';
import '../../../../widget/base/base_page.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileEditGeneralTab extends BasePage {
  ProfileEditGeneralTab({super.key});

  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;
  DanhSachChucVuDataResponse? danhSachChucVuDataResponseHienTai;
  DanhSachChucVuDataResponse? danhSachChucVuDataResponseMongMuon;
  DanhSachTrinhDoDataResponse? danhSachTrinhDoDataResponse;
  DanhSachNhuCauViecLamDataResponse? danhSachNhuCauViecLamDataResponse;

  @override
  State<StatefulWidget> createState() => ProfileEditGeneralTabState();
}

class ProfileEditGeneralTabState
    extends BaseScreenStateActive<ProfileEditGeneralTab> {
  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  late DanhSachChucVuBloc danhSachChucVuBloc;
  late DanhSachNhuCauViecLamBloc danhSachNhuCauViecLamBloc;

  @override
  void initDataLoading() {
    danhSachChucVuBloc = DanhSachChucVuBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
    danhSachNhuCauViecLamBloc = DanhSachNhuCauViecLamBloc();
    callApi();
    // TODO: implement initDataLoading
    super.initDataLoading();
  }

  @override
  void callApi() {
    danhSachChucVuBloc.add(DanhSachChucVuEvent(
        request: DanhSachChucVuRequest(obj: DanhSachChucVuDataRequest())));
    danhSachTrinhDoBloc.add(DanhSachTrinhDoEvent(
        request: DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest())));
    danhSachMucLuongBloc.add(DanhSachMucLuongEvent(
        request: DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest())));
    danhSachKinhNghiemBloc.add(DanhSachKinhNghiemEvent(
        request:
            DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest())));
    danhSachNhuCauViecLamBloc.add(DanhSachNhuCauViecLamEvent(
        request: DanhSachNhuCauViecLamRequest(
            obj: DanhSachNhuCauViecLamDataRequest())));
    super.callApi();
  }

  @override
  String getPageTitle(BuildContext context) => "Tạo hồ sơ";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
                create: (_) => danhSachChucVuBloc,
                child: BlocListener<DanhSachChucVuBloc,
                    DataMultiState<DanhSachChucVuDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachChucVuDataResponse> state) {},
                  child: BlocBuilder<DanhSachChucVuBloc,
                      DataMultiState<DanhSachChucVuDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachChucVuDataResponse> state) =>
                        _buildViewSearchDanhSachChucVuHienTai(
                            context, state.data ?? []),
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
                create: (_) => danhSachChucVuBloc,
                child: BlocListener<DanhSachChucVuBloc,
                    DataMultiState<DanhSachChucVuDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachChucVuDataResponse> state) {},
                  child: BlocBuilder<DanhSachChucVuBloc,
                      DataMultiState<DanhSachChucVuDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachChucVuDataResponse> state) =>
                        _buildViewSearchDanhSachChucVuMongMuon(
                            context, state.data ?? []),
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
              create: (_) => danhSachKinhNghiemBloc,
              child: BlocListener<DanhSachKinhNghiemBloc,
                  DataMultiState<DanhSachKinhNghiemDataResponse>>(
                listener: (BuildContext context,
                    DataMultiState<DanhSachKinhNghiemDataResponse> state) {},
                child: BlocBuilder<DanhSachKinhNghiemBloc,
                        DataMultiState<DanhSachKinhNghiemDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachKinhNghiemDataResponse>
                                state) =>
                        _buildViewSearchDanhSachKinhNghiem(
                            context, state.data)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
                create: (_) => danhSachTrinhDoBloc,
                child: BlocListener<DanhSachTrinhDoBloc,
                    DataMultiState<DanhSachTrinhDoDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachTrinhDoDataResponse> state) {},
                  child: BlocBuilder<DanhSachTrinhDoBloc,
                      DataMultiState<DanhSachTrinhDoDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachTrinhDoDataResponse>
                                state) =>
                        _buildViewSearchDanhSachTrinhDo(
                            context, state.data ?? []),
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
                create: (_) => danhSachMucLuongBloc,
                child: BlocListener<DanhSachMucLuongBloc,
                    DataMultiState<DanhSachMucLuongDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachMucLuongDataResponse> state) {},
                  child: BlocBuilder<DanhSachMucLuongBloc,
                      DataMultiState<DanhSachMucLuongDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachMucLuongDataResponse>
                                state) =>
                        _buildViewSearchDanhSachMucLuong(context, state.data),
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
                create: (_) => danhSachNhuCauViecLamBloc,
                child: BlocListener<DanhSachNhuCauViecLamBloc,
                    DataMultiState<DanhSachNhuCauViecLamDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachNhuCauViecLamDataResponse>
                          state) {},
                  child: BlocBuilder<DanhSachNhuCauViecLamBloc,
                      DataMultiState<DanhSachNhuCauViecLamDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachNhuCauViecLamDataResponse>
                                state) =>
                        _buildViewSearchDanhSachNhuCauViecLam(
                            context, state.data),
                  ),
                )),
          ),
        ],
      );

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    return SelectItem<DanhSachKinhNghiemDataResponse>(
      selectedItem: widget.danhSachKinhNghiemDataResponse,
      list: list,
      itemAsString: (DanhSachKinhNghiemDataResponse u) =>
          u.experienceName.supportHtml(),
      onChanged: (DanhSachKinhNghiemDataResponse? data) {
        if (widget.danhSachKinhNghiemDataResponse != data) {
          widget.danhSachKinhNghiemDataResponse = data;
        }
      },
      title: "Kinh nghiệm",
    );
  }

  Widget _buildViewSearchDanhSachMucLuong(
      BuildContext context, List<DanhSachMucLuongDataResponse> list) {
    return SelectItem<DanhSachMucLuongDataResponse>(
      selectedItem: widget.danhSachMucLuongDataResponse,
      list: list,
      itemAsString: (DanhSachMucLuongDataResponse u) =>
          u.salaryName.supportHtml(),
      onChanged: (DanhSachMucLuongDataResponse? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          widget.danhSachMucLuongDataResponse = data;
        }
      },
      title: "Mức lương",
    );
  }

  Widget _buildViewSearchDanhSachChucVuMongMuon(
      BuildContext context, List<DanhSachChucVuDataResponse> list) {
    return SelectItemNormal<DanhSachChucVuDataResponse>(
      selectedItem: widget.danhSachChucVuDataResponseMongMuon,
      list: list,
      itemAsString: (DanhSachChucVuDataResponse u) =>
          u.positionName.supportHtml(),
      onChanged: (DanhSachChucVuDataResponse? data) {
        if (widget.danhSachChucVuDataResponseMongMuon != data) {
          widget.danhSachChucVuDataResponseMongMuon = data;
        }
      },
      title: 'Chức vụ mong muốn',
    );
  }

  Widget _buildViewSearchDanhSachChucVuHienTai(
      BuildContext context, List<DanhSachChucVuDataResponse> list) {
    return SelectItemNormal<DanhSachChucVuDataResponse>(
      selectedItem: widget.danhSachChucVuDataResponseHienTai,
      list: list,
      itemAsString: (DanhSachChucVuDataResponse u) =>
          u.positionName.supportHtml(),
      onChanged: (DanhSachChucVuDataResponse? data) {
        if (widget.danhSachChucVuDataResponseHienTai != data) {
          widget.danhSachChucVuDataResponseHienTai = data;
        }
      },
      title: "Chức vụ hiện tại",
    );
  }

  Widget _buildViewSearchDanhSachTrinhDo(
      BuildContext context, List<DanhSachTrinhDoDataResponse> list) {
    return SelectItemNormal<DanhSachTrinhDoDataResponse>(
      selectedItem: widget.danhSachTrinhDoDataResponse,
      list: list,
      itemAsString: (DanhSachTrinhDoDataResponse u) =>
          u.educationName.supportHtml(),
      onChanged: (DanhSachTrinhDoDataResponse? data) {
        if (widget.danhSachTrinhDoDataResponse != data) {
          widget.danhSachTrinhDoDataResponse = data;
        }
      },
      title: "Trình độ",
    );
  }

  Widget _buildViewSearchDanhSachNhuCauViecLam(
      BuildContext context, List<DanhSachNhuCauViecLamDataResponse> list) {
    return SelectItemNormal<DanhSachNhuCauViecLamDataResponse>(
      selectedItem: widget.danhSachNhuCauViecLamDataResponse,
      list: list,
      itemAsString: (DanhSachNhuCauViecLamDataResponse u) =>
          u.careerName.supportHtml(),
      onChanged: (DanhSachNhuCauViecLamDataResponse? data) {
        if (widget.danhSachTrinhDoDataResponse != data) {
          widget.danhSachNhuCauViecLamDataResponse = data;
        }
      },
      title: "Nhu cầu làm việc",
    );
  }
}
