//
// Created by BlackRose on 18/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_doanh_nghiep_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_doanh_nghiep_event.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/admin/data/work_search_by_user_name_data_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_doanh_nghiep_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/search_request_data.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_doanh_nghiep_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class FilterJobAdvertisementDialog extends BasePage {
  WorkSearchByUserNameDataRequest data;

  final VoidCallback onPressed;
  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachDoanhNghiepDataResponse? danhSachDoanhNghiepDataResponse;
  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;

  FilterJobAdvertisementDialog(
      {super.key, required this.data, required this.onPressed});

  @override
  State<StatefulWidget> createState() => FilterJobAdvertisementDialogState();
}

class FilterJobAdvertisementDialogState
    extends BaseScreenState<FilterJobAdvertisementDialog> {
  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;
  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  final _danhSachQuanHuyenKey = GlobalKey<SelectItemState>();
  final _danhSachDoanhNghiepKey = GlobalKey<SelectItemState>();

  @override
  void disposeBloc() {
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    danhSachTinhTpBloc.close();
    danhSachQuanHuyenBloc.close();
    danhSachMucLuongBloc.close();
    danhSachKinhNghiemBloc.close();
    danhSachGioiTinhBloc.close();
    danhSachTrinhDoBloc.close();
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    danhSachTinhTpBloc.add(DanhSachTinhTpEvent(
        request: DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest())));
    if (widget.danhSachTinhTpDataResponse != null) {
      danhSachQuanHuyenBloc.add(DanhSachQuanHuyenEvent(
          request: DanhSachQuanHuyenRequest(
              obj: DanhSachQuanHuyenDataRequest(tinhTp: widget.data.tinhTp))));
    }

    danhSachMucLuongBloc.add(DanhSachMucLuongEvent(
        request: DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest())));
    danhSachKinhNghiemBloc.add(DanhSachKinhNghiemEvent(
        request:
            DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest())));
  }

  @override
  Widget build(BuildContext context) => Dialog(
        insetPadding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text("Tiêu chí tìm kiếm thêm"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachTinhTpBloc,
                    child: BlocListener<DanhSachTinhTpBloc,
                        DataMultiState<DanhSachTinhTpDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachTinhTpDataResponse> state) {},
                      child: BlocBuilder<DanhSachTinhTpBloc,
                          DataMultiState<DanhSachTinhTpDataResponse>>(
                        builder: (BuildContext context,
                                DataMultiState<DanhSachTinhTpDataResponse>
                                    state) =>
                            _buildViewSearchDanhSachTinhTp(context, state.data),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachQuanHuyenBloc,
                    child: BlocListener<DanhSachQuanHuyenBloc,
                        DataMultiState<DanhSachQuanHuyenDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachQuanHuyenDataResponse>
                              state) {},
                      child: BlocBuilder<DanhSachQuanHuyenBloc,
                          DataMultiState<DanhSachQuanHuyenDataResponse>>(
                        builder: (BuildContext context,
                                DataMultiState<DanhSachQuanHuyenDataResponse>
                                    state) =>
                            _buildViewSearchDanhSachQuanHuyen(
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
                  create: (_) => danhSachKinhNghiemBloc,
                  child: BlocListener<DanhSachKinhNghiemBloc,
                      DataMultiState<DanhSachKinhNghiemDataResponse>>(
                    listener: (BuildContext context,
                        DataMultiState<DanhSachKinhNghiemDataResponse>
                            state) {},
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
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultButton(
                          text: 'Hủy',
                          backgroundColor: Colors.redAccent,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                      ),
                      Expanded(
                        child: DefaultButton(
                          text: 'Tìm kiếm',
                          onPressed: () {
                            widget.onPressed();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );

  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    return SelectItem<DanhSachTinhTpDataResponse>(
      selectedItem: widget.danhSachTinhTpDataResponse,
      icon: FontAwesomeIcons.city,
      list: list,
      itemAsString: (DanhSachTinhTpDataResponse u) =>
          u.regionalName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachTinhTpDataResponse? data) {
        if (widget.danhSachTinhTpDataResponse != data) {
          widget.danhSachTinhTpDataResponse = data;
          widget.data.tinhTp = data?.regionalID;
          widget.data.quanHuyen = null;
          widget.danhSachQuanHuyenDataResponse = null;
          widget.danhSachDoanhNghiepDataResponse = null;
          _danhSachQuanHuyenKey.currentState?.clear();
          _danhSachDoanhNghiepKey.currentState?.clear();
          danhSachQuanHuyenBloc.add(DanhSachQuanHuyenEvent(
              request: DanhSachQuanHuyenRequest(
                  obj: DanhSachQuanHuyenDataRequest(
                      tinhTp: widget.data.tinhTp))));
        }
      },
      title: "Tình thành phố",
    );
  }

  Widget _buildViewSearchDanhSachQuanHuyen(
      BuildContext context, List<DanhSachQuanHuyenDataResponse> list) {
    return SelectItem<DanhSachQuanHuyenDataResponse>(
      key: _danhSachQuanHuyenKey,
      icon: FontAwesomeIcons.locationArrow,
      list: list,
      selectedItem: widget.danhSachQuanHuyenDataResponse,
      itemAsString: (DanhSachQuanHuyenDataResponse u) =>
          u.regionalName.supportHtml(),
      onChanged: (DanhSachQuanHuyenDataResponse? data) {
        if (widget.danhSachQuanHuyenDataResponse != data) {
          widget.danhSachQuanHuyenDataResponse = data;
          widget.data.quanHuyen = data?.regionalID;
          widget.danhSachDoanhNghiepDataResponse = null;
          _danhSachDoanhNghiepKey.currentState?.clear();
        }
      },
      title: "Quận huyện",
    );
  }

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    return SelectItem<DanhSachKinhNghiemDataResponse>(
      list: list,
      icon: FontAwesomeIcons.chartBar,
      selectedItem: widget.danhSachKinhNghiemDataResponse,
      itemAsString: (DanhSachKinhNghiemDataResponse u) =>
          u.experienceName.supportHtml(),
      onChanged: (DanhSachKinhNghiemDataResponse? data) {
        if (widget.danhSachKinhNghiemDataResponse != data) {
          widget.danhSachKinhNghiemDataResponse = data;
          widget.data.kinhNghiem = data?.experienceID;
        }
      },
      title: "Kinh nghiệm",
    );
  }

  Widget _buildViewSearchDanhSachMucLuong(
      BuildContext context, List<DanhSachMucLuongDataResponse> list) {
    return SelectItem<DanhSachMucLuongDataResponse>(
      list: list,
      icon: FontAwesomeIcons.moneyBill,
      selectedItem: widget.danhSachMucLuongDataResponse,
      itemAsString: (DanhSachMucLuongDataResponse u) =>
          u.salaryName.supportHtml(),
      onChanged: (DanhSachMucLuongDataResponse? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          widget.danhSachMucLuongDataResponse = data;
          widget.data.mucLuong = data?.salaryID;
        }
      },
      title: "Mức lương",
    );
  }

}
