import 'package:dropdown_search/dropdown_search.dart';
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
import 'package:eportal/model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_doanh_nghiep_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/search_request_data.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_doanh_nghiep_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../extension/string_extension.dart';
import '../base/base_page.dart';
import '../default_button/default_button.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FilterJobDialog extends BasePage {
  SearchRequestData data;

  final VoidCallback onPressed;
  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachDoanhNghiepDataResponse? danhSachDoanhNghiepDataResponse;
  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;

  FilterJobDialog({super.key, required this.data, required this.onPressed});

  @override
  State<StatefulWidget> createState() => FilterJobDialogState();
}

class FilterJobDialogState extends BaseScreenState<FilterJobDialog> {
  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;
  late DanhSachDoanhNghiepBloc danhSachDoanhNghiepBloc;
  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  final _danhSachQuanHuyenKey = GlobalKey<SelectItemState>();
  final _danhSachDoanhNghiepKey = GlobalKey<SelectItemState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void initDataLoading() {
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
    danhSachDoanhNghiepBloc = DanhSachDoanhNghiepBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    danhSachTinhTpBloc.add(DanhSachTinhTpEvent(
        request: DanhSachTinhTpRequest(obj: CommonNewDataRequest())));
    if (widget.danhSachTinhTpDataResponse != null) {
      danhSachQuanHuyenBloc.add(DanhSachQuanHuyenEvent(
          request: DanhSachQuanHuyenRequest(
              obj: DanhSachQuanHuyenDataRequest(tinhTp: widget.data.tinhTp))));
      if (widget.danhSachDoanhNghiepDataResponse != null) {
        danhSachDoanhNghiepBloc.add(DanhSachDoanhNghiepEvent(
            request: DanhSachDoanhNghiepRequest(
                obj: DanhSachDoanhNghiepDataRequest(
                    tinhTp: widget.data.tinhTp,
                    quanHuyen: widget.data.quanHuyen))));
      }
    }

    danhSachMucLuongBloc.add(DanhSachMucLuongEvent(
        request: DanhSachMucLuongRequest(obj: CommonNewDataRequest())));
    danhSachKinhNghiemBloc.add(DanhSachKinhNghiemEvent(
        request: DanhSachKinhNghiemRequest(obj: CommonNewDataRequest())));
    super.callApi();
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
                            _buildViewSearchDanhSachTinhTp(
                                context, state.data ?? []),
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
                                context, state.data ?? []),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachDoanhNghiepBloc,
                    child: BlocListener<DanhSachDoanhNghiepBloc,
                        DataMultiState<DanhSachDoanhNghiepDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachDoanhNghiepDataResponse>
                              state) {},
                      child: BlocBuilder<DanhSachDoanhNghiepBloc,
                          DataMultiState<DanhSachDoanhNghiepDataResponse>>(
                        builder: (BuildContext context,
                                DataMultiState<DanhSachDoanhNghiepDataResponse>
                                    state) =>
                            _buildViewSearchDanhSachDoanhNghiep(
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
      list: list,
      itemAsString: (DanhSachTinhTpDataResponse u) =>
          u.regionalName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachTinhTpDataResponse? data) {
        if (widget.danhSachTinhTpDataResponse != data) {
          widget.danhSachTinhTpDataResponse = data;
          widget.data.tinhTp = data?.regionalID;
          widget.data.quanHuyen = null;
          widget.data.doanhNghiep = null;
          widget.danhSachQuanHuyenDataResponse = null;
          widget.danhSachDoanhNghiepDataResponse = null;
          _danhSachQuanHuyenKey.currentState?.clear();
          _danhSachDoanhNghiepKey.currentState?.clear();
          danhSachQuanHuyenBloc.add(DanhSachQuanHuyenEvent(
              request: DanhSachQuanHuyenRequest(
                  obj: DanhSachQuanHuyenDataRequest(
                      tinhTp: widget.data.tinhTp))));

          danhSachDoanhNghiepBloc.add(DanhSachDoanhNghiepEvent(
              request: DanhSachDoanhNghiepRequest(
                  obj: DanhSachDoanhNghiepDataRequest(
                      tinhTp: widget.data.tinhTp,
                      quanHuyen: widget.data.quanHuyen))));
        }
      },
      title: "Tình thành phố",
    );
  }

  Widget _buildViewSearchDanhSachQuanHuyen(
      BuildContext context, List<DanhSachQuanHuyenDataResponse> list) {
    return SelectItem<DanhSachQuanHuyenDataResponse>(
      key: _danhSachQuanHuyenKey,
      list: list,
      selectedItem: widget.danhSachQuanHuyenDataResponse,
      itemAsString: (DanhSachQuanHuyenDataResponse u) =>
          u.regionalName.supportHtml(),
      onChanged: (DanhSachQuanHuyenDataResponse? data) {
        if (widget.danhSachQuanHuyenDataResponse != data) {
          widget.danhSachQuanHuyenDataResponse = data;
          widget.data.quanHuyen = data?.regionalID;
          widget.data.doanhNghiep = null;
          widget.danhSachDoanhNghiepDataResponse = null;
          _danhSachDoanhNghiepKey.currentState?.clear();
          danhSachDoanhNghiepBloc.add(DanhSachDoanhNghiepEvent(
              request: DanhSachDoanhNghiepRequest(
                  obj: DanhSachDoanhNghiepDataRequest(
                      tinhTp: widget.data.tinhTp,
                      quanHuyen: widget.data.quanHuyen))));
        }
      },
      title: "Quận huyện",
    );
  }

  Widget _buildViewSearchDanhSachDoanhNghiep(
      BuildContext context, List<DanhSachDoanhNghiepDataResponse> list) {
    return SelectItem<DanhSachDoanhNghiepDataResponse>(
      key: _danhSachDoanhNghiepKey,
      list: list,
      selectedItem: widget.danhSachDoanhNghiepDataResponse,
      itemAsString: (DanhSachDoanhNghiepDataResponse u) =>
          u.businessVn.supportHtml(),
      onChanged: (DanhSachDoanhNghiepDataResponse? data) {
        if (widget.danhSachDoanhNghiepDataResponse != data) {
          widget.danhSachDoanhNghiepDataResponse = data;
          widget.data.doanhNghiep = data?.doanhNghiepID;
        }
      },
      title: "Công ty",
    );
  }

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    return SelectItem<DanhSachKinhNghiemDataResponse>(
      list: list,
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
      selectedItem: widget.danhSachMucLuongDataResponse,
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
}
