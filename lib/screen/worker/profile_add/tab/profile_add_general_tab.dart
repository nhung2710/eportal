import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuc_vu_event.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuc_vu_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuc_vu_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuc_vu_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_trinh_do_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/common_new/danh_sach_chuc_vu_bloc.dart';
import '../../../../bloc/common_new/danh_sach_nhu_cau_bloc.dart';
import '../../../../event/common_new/danh_sach_nhu_cau_event.dart';
import '../../../../event/common_new/danh_sach_trinh_do_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_nhu_cau_request.dart';
import '../../../../model/api/request/common_new/danh_sach_trinh_do_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_nhu_cau_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';
import '../../../../model/api/response/common_new/data/danh_sach_nhu_cau_data_response.dart';
import '../../../../widget/base/base_page.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddGeneralTab extends BasePage {
  ProfileAddGeneralTab({super.key});

  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;
  DanhSachChucVuDataResponse? danhSachChucVuDataResponseHienTai;
  DanhSachChucVuDataResponse? danhSachChucVuDataResponseMongMuon;
  DanhSachTrinhDoDataResponse? danhSachTrinhDoDataResponse;
  DanhSachNhuCauDataResponse? danhSachNhuCauDataResponse;

  @override
  State<StatefulWidget> createState() => ProfileAddGeneralTabState();
}

class ProfileAddGeneralTabState
    extends BaseScreenStateActive<ProfileAddGeneralTab> {
  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  late DanhSachChucVuBloc danhSachChucVuBloc;
  late DanhSachNhuCauBloc danhSachNhuCauBloc;
  DanhSachChucVuRequest danhSachChucVuRequest = DanhSachChucVuRequest(obj: DanhSachChucVuDataRequest());
  DanhSachTrinhDoRequest danhSachTrinhDoRequest = DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest());
  DanhSachMucLuongRequest danhSachMucLuongRequest = DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest());
  DanhSachKinhNghiemRequest danhSachKinhNghiemRequest = DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest());
  DanhSachNhuCauRequest danhSachNhuCauRequest = DanhSachNhuCauRequest(obj: DanhSachNhuCauDataRequest());
  @override
  void initBloc() {
    danhSachChucVuBloc = DanhSachChucVuBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
    danhSachNhuCauBloc = DanhSachNhuCauBloc();
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
  void initDataLoading() {
    callApi();
    // TODO: implement initDataLoading
  }

  @override
  void callApi() {
    danhSachChucVuBloc.add(DanhSachChucVuEvent(
        request: danhSachChucVuRequest));
    danhSachTrinhDoBloc.add(DanhSachTrinhDoEvent(
        request: danhSachTrinhDoRequest));
    danhSachMucLuongBloc.add(DanhSachMucLuongEvent(
        request: danhSachMucLuongRequest));
    danhSachKinhNghiemBloc.add(DanhSachKinhNghiemEvent(
        request:
            danhSachKinhNghiemRequest));
    danhSachNhuCauBloc.add(DanhSachNhuCauEvent(
        request: danhSachNhuCauRequest));

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
                      DataMultiState<DanhSachChucVuDataResponse> state) {},
                  child: BlocBuilder<DanhSachChucVuBloc,
                      DataMultiState<DanhSachChucVuDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachChucVuDataResponse> state) =>
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
                        _buildViewSearchDanhSachTrinhDo(context, state.data),
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
                create: (_) => danhSachNhuCauBloc,
                child: BlocListener<DanhSachNhuCauBloc,
                    DataMultiState<DanhSachNhuCauDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachNhuCauDataResponse> state) {},
                  child: BlocBuilder<DanhSachNhuCauBloc,
                      DataMultiState<DanhSachNhuCauDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachNhuCauDataResponse> state) =>
                        _buildViewSearchDanhSachNhuCau(context, state.data),
                  ),
                )),
          ),
        ],
      );

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    return SelectItem<DanhSachKinhNghiemDataResponse>(
      icon: FontAwesomeIcons.timeline,
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
      icon: FontAwesomeIcons.moneyBill,
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
      icon: FontAwesomeIcons.userTie,
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
      icon: FontAwesomeIcons.userTie,
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
      icon: FontAwesomeIcons.graduationCap,
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

  Widget _buildViewSearchDanhSachNhuCau(
      BuildContext context, List<DanhSachNhuCauDataResponse> list) {
    return SelectItemNormal<DanhSachNhuCauDataResponse>(
      icon: FontAwesomeIcons.handHolding,
      selectedItem: widget.danhSachNhuCauDataResponse,
      list: list,
      itemAsString: (DanhSachNhuCauDataResponse u) => u.needsName.supportHtml(),
      onChanged: (DanhSachNhuCauDataResponse? data) {
        if (widget.danhSachTrinhDoDataResponse != data) {
          widget.danhSachNhuCauDataResponse = data;
        }
      },
      title: "Nhu cầu làm việc",
    );
  }

}
