//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_chuc_vu_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_nhu_cau_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_nhu_cau_event.dart';
import 'package:eportal/event/common_new/danh_sach_trinh_do_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuc_vu_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nhu_cau_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuc_vu_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nhu_cau_data_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuc_vu_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nhu_cau_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_trinh_do_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_keep_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_select_item_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/danh_sach_chuc_vu_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_muc_luong_request.dart';
import '../../../../model/api/request/common_new/danh_sach_trinh_do_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';

class UserProfileGeneralTab extends BasePageWidget {
  final JobUserListByUserNameDataResponse? data;

  const UserProfileGeneralTab({super.key, this.data});

  @override
  State<StatefulWidget> createState() => UserProfileGeneralTabState();
}

class UserProfileGeneralTabState
    extends BasePageKeepState<UserProfileGeneralTab> {
  DanhSachChucVuDataResponse? danhSachChucVuDataResponseHienTai;
  DanhSachChucVuDataResponse? danhSachChucVuDataResponseMongMuon;
  DanhSachNhuCauDataResponse? danhSachNhuCauDataResponse;
  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachTrinhDoDataResponse? danhSachTrinhDoDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;

  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  late DanhSachChucVuBloc danhSachChucVuBloc;
  late DanhSachNhuCauBloc danhSachNhuCauBloc;

  DanhSachChucVuEvent danhSachChucVuEvent = DanhSachChucVuEvent(
      request: DanhSachChucVuRequest(obj: DanhSachChucVuDataRequest()));
  DanhSachTrinhDoEvent danhSachTrinhDoEvent = DanhSachTrinhDoEvent(
      request: DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest()));
  DanhSachMucLuongEvent danhSachMucLuongEvent = DanhSachMucLuongEvent(
      request: DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest()));
  DanhSachKinhNghiemEvent danhSachKinhNghiemEvent = DanhSachKinhNghiemEvent(
      request: DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest()));
  DanhSachNhuCauEvent danhSachNhuCauEvent = DanhSachNhuCauEvent(
      request: DanhSachNhuCauRequest(obj: DanhSachNhuCauDataRequest()));

  @override
  void callApi() {
    // TODO: implement callApi
    danhSachChucVuBloc.add(danhSachChucVuEvent);
    danhSachTrinhDoBloc.add(danhSachTrinhDoEvent);
    danhSachMucLuongBloc.add(danhSachMucLuongEvent);
    danhSachKinhNghiemBloc.add(danhSachKinhNghiemEvent);
    danhSachNhuCauBloc.add(danhSachNhuCauEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachChucVuBloc.close();
    danhSachMucLuongBloc.close();
    danhSachKinhNghiemBloc.close();
    danhSachGioiTinhBloc.close();
    danhSachTrinhDoBloc.close();
    danhSachNhuCauBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    danhSachChucVuBloc = DanhSachChucVuBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
    danhSachNhuCauBloc = DanhSachNhuCauBloc();
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  Widget pageUI(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: BlocProvider(
                        create: (_) => danhSachChucVuBloc,
                        child: BlocListener<DanhSachChucVuBloc,
                            DataMultiState<DanhSachChucVuDataResponse>>(
                          listener: (BuildContext context,
                              DataMultiState<DanhSachChucVuDataResponse>
                                  state) {},
                          child: BlocBuilder<DanhSachChucVuBloc,
                              DataMultiState<DanhSachChucVuDataResponse>>(
                            builder: (BuildContext context,
                                    DataMultiState<DanhSachChucVuDataResponse>
                                        state) =>
                                _buildViewSearchDanhSachChucVuHienTai(
                                    context, state.data),
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
                              DataMultiState<DanhSachChucVuDataResponse>
                                  state) {},
                          child: BlocBuilder<DanhSachChucVuBloc,
                              DataMultiState<DanhSachChucVuDataResponse>>(
                            builder: (BuildContext context,
                                    DataMultiState<DanhSachChucVuDataResponse>
                                        state) =>
                                _buildViewSearchDanhSachChucVuMongMuon(
                                    context, state.data),
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
                              DataMultiState<DanhSachKinhNghiemDataResponse>
                                  state) {},
                          child: BlocBuilder<DanhSachKinhNghiemBloc,
                              DataMultiState<DanhSachKinhNghiemDataResponse>>(
                            builder: (BuildContext context,
                                    DataMultiState<
                                            DanhSachKinhNghiemDataResponse>
                                        state) =>
                                _buildViewSearchDanhSachKinhNghiem(
                                    context, state.data),
                          ),
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: BlocProvider(
                        create: (_) => danhSachTrinhDoBloc,
                        child: BlocListener<DanhSachTrinhDoBloc,
                            DataMultiState<DanhSachTrinhDoDataResponse>>(
                          listener: (BuildContext context,
                              DataMultiState<DanhSachTrinhDoDataResponse>
                                  state) {},
                          child: BlocBuilder<DanhSachTrinhDoBloc,
                              DataMultiState<DanhSachTrinhDoDataResponse>>(
                            builder: (BuildContext context,
                                    DataMultiState<DanhSachTrinhDoDataResponse>
                                        state) =>
                                _buildViewSearchDanhSachTrinhDo(
                                    context, state.data),
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
                              DataMultiState<DanhSachMucLuongDataResponse>
                                  state) {},
                          child: BlocBuilder<DanhSachMucLuongBloc,
                              DataMultiState<DanhSachMucLuongDataResponse>>(
                            builder: (BuildContext context,
                                    DataMultiState<DanhSachMucLuongDataResponse>
                                        state) =>
                                _buildViewSearchDanhSachMucLuong(
                                    context, state.data),
                          ),
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: BlocProvider(
                        create: (_) => danhSachNhuCauBloc,
                        child: BlocListener<DanhSachNhuCauBloc,
                            DataMultiState<DanhSachNhuCauDataResponse>>(
                          listener: (BuildContext context,
                              DataMultiState<DanhSachNhuCauDataResponse>
                                  state) {},
                          child: BlocBuilder<DanhSachNhuCauBloc,
                              DataMultiState<DanhSachNhuCauDataResponse>>(
                            builder: (BuildContext context,
                                    DataMultiState<DanhSachNhuCauDataResponse>
                                        state) =>
                                _buildViewSearchDanhSachNhuCau(
                                    context, state.data),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildViewSearchDanhSachChucVuHienTai(
      BuildContext context, List<DanhSachChucVuDataResponse> list) {
    if (widget.data != null &&
        widget.data!.currentLevel != null &&
        danhSachChucVuDataResponseHienTai == null) {
      danhSachChucVuDataResponseHienTai = list
          .where((element) => element.positionID == widget.data!.currentLevel)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachChucVuDataResponse>(
        icon: FontAwesomeIcons.userTie,
        selectedItem: danhSachChucVuDataResponseHienTai,
        list: list,
        itemAsString: (DanhSachChucVuDataResponse u) =>
            u.positionName.supportHtml(),
        onChanged: (DanhSachChucVuDataResponse? data) {
          if (danhSachChucVuDataResponseHienTai != data) {
            danhSachChucVuDataResponseHienTai = data;
          }
        },
        labelText: "Chức vụ hiện tại",
        hintText: "Chức vụ hiện tại",
        title: "Chức vụ hiện tại");
  }

  Widget _buildViewSearchDanhSachChucVuMongMuon(
      BuildContext context, List<DanhSachChucVuDataResponse> list) {
    if (widget.data != null &&
        widget.data!.levelDesired != null &&
        danhSachChucVuDataResponseMongMuon == null) {
      danhSachChucVuDataResponseMongMuon = list
          .where((element) => element.positionID == widget.data!.levelDesired)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachChucVuDataResponse>(
        icon: FontAwesomeIcons.userTie,
        selectedItem: danhSachChucVuDataResponseMongMuon,
        list: list,
        itemAsString: (DanhSachChucVuDataResponse u) =>
            u.positionName.supportHtml(),
        onChanged: (DanhSachChucVuDataResponse? data) {
          if (danhSachChucVuDataResponseMongMuon != data) {
            danhSachChucVuDataResponseMongMuon = data;
          }
        },
        labelText: "Chức vụ mong muốn",
        hintText: "Chức vụ mong muốn",
        title: "Chức vụ mong muốn");
  }

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    if (widget.data != null &&
        widget.data!.experienceID != null &&
        danhSachKinhNghiemDataResponse == null) {
      danhSachKinhNghiemDataResponse = list
          .where((element) => element.experienceID == widget.data!.experienceID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachKinhNghiemDataResponse>(
        icon: FontAwesomeIcons.timeline,
        selectedItem: danhSachKinhNghiemDataResponse,
        list: list,
        itemAsString: (DanhSachKinhNghiemDataResponse u) =>
            u.experienceName.supportHtml(),
        onChanged: (DanhSachKinhNghiemDataResponse? data) {
          if (danhSachKinhNghiemDataResponse != data) {
            danhSachKinhNghiemDataResponse = data;
          }
        },
        labelText: "Kinh nghiệm",
        hintText: "Kinh nghiệm",
        title: "Kinh nghiệm");
  }

  Widget _buildViewSearchDanhSachTrinhDo(
      BuildContext context, List<DanhSachTrinhDoDataResponse> list) {
    if (widget.data != null &&
        widget.data!.levelID != null &&
        danhSachTrinhDoDataResponse == null) {
      danhSachTrinhDoDataResponse = list
          .where((element) => element.educationID == widget.data!.levelID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachTrinhDoDataResponse>(
        icon: FontAwesomeIcons.graduationCap,
        selectedItem: danhSachTrinhDoDataResponse,
        list: list,
        itemAsString: (DanhSachTrinhDoDataResponse u) =>
            u.educationName.supportHtml(),
        onChanged: (DanhSachTrinhDoDataResponse? data) {
          if (danhSachTrinhDoDataResponse != data) {
            danhSachTrinhDoDataResponse = data;
          }
        },
        labelText: "Trình độ học vấn",
        hintText: "Trình độ học vấn",
        title: "Trình độ học vấn");
  }

  Widget _buildViewSearchDanhSachMucLuong(
      BuildContext context, List<DanhSachMucLuongDataResponse> list) {
    if (widget.data != null &&
        widget.data!.salaryID != null &&
        danhSachMucLuongDataResponse == null) {
      danhSachMucLuongDataResponse = list
          .where((element) => element.salaryID == widget.data!.salaryID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachMucLuongDataResponse>(
      icon: FontAwesomeIcons.moneyBill,
      selectedItem: danhSachMucLuongDataResponse,
      list: list,
      itemAsString: (DanhSachMucLuongDataResponse u) =>
          u.salaryName.supportHtml(),
      onChanged: (DanhSachMucLuongDataResponse? data) {
        if (danhSachMucLuongDataResponse != data) {
          danhSachMucLuongDataResponse = data;
        }
      },
      labelText: "Mức lương",
      hintText: "Mức lương",
      title: "Mức lương",
    );
  }

  Widget _buildViewSearchDanhSachNhuCau(
      BuildContext context, List<DanhSachNhuCauDataResponse> list) {
    if (widget.data != null &&
        widget.data!.needsID != null &&
        danhSachMucLuongDataResponse == null) {
      danhSachNhuCauDataResponse = list
          .where((element) => element.needsID == widget.data!.needsID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachNhuCauDataResponse>(
        icon: FontAwesomeIcons.handHolding,
        selectedItem: danhSachNhuCauDataResponse,
        list: list,
        itemAsString: (DanhSachNhuCauDataResponse u) =>
            u.needsName.supportHtml(),
        onChanged: (DanhSachNhuCauDataResponse? data) {
          if (danhSachNhuCauDataResponse != data) {
            danhSachNhuCauDataResponse = data;
          }
        },
        labelText: "Nhu cầu làm việc",
        hintText: "Nhu cầu làm việc",
        title: "Nhu cầu làm việc");
  }
}
