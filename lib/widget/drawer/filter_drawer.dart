import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/common_new/danh_sach_doanh_nghiep_bloc.dart';
import '../../bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import '../../bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import '../../bloc/common_new/danh_sach_muc_luong_bloc.dart';
import '../../bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import '../../bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import '../../bloc/common_new/danh_sach_trinh_do_bloc.dart';
import '../../event/common_new/danh_sach_doanh_nghiep_event.dart';
import '../../event/common_new/danh_sach_kinh_nghiem_event.dart';
import '../../event/common_new/danh_sach_muc_luong_event.dart';
import '../../event/common_new/danh_sach_quan_huyen_event.dart';
import '../../event/common_new/danh_sach_tinh_tp_event.dart';
import '../../extension/string_extension.dart';
import '../../model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import '../../model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import '../../model/api/request/common_new/danh_sach_muc_luong_request.dart';
import '../../model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import '../../model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import '../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../model/api/request/common_new/data/danh_sach_doanh_nghiep_data_request.dart';
import '../../model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import '../../model/api/request/common_new/data/search_request_data.dart';
import '../../model/api/request/common_new/work_search_request.dart';
import '../../model/api/response/common_new/danh_sach_doanh_nghiep_response.dart';
import '../../model/api/response/common_new/danh_sach_kinh_nghiem_response.dart';
import '../../model/api/response/common_new/danh_sach_muc_luong_response.dart';
import '../../model/api/response/common_new/danh_sach_quan_huyen_response.dart';
import '../../model/api/response/common_new/danh_sach_tinh_tp_response.dart';
import '../../model/api/response/common_new/data/danh_sach_doanh_nghiep_data_response.dart';
import '../../model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import '../../model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import '../../model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import '../../model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import '../../state/base/base_state.dart';
import '../base/base_page.dart';

//
// Created by BlackRose on 15/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FilterDrawer extends BasePage {
  SearchRequestData data;

  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachDoanhNghiepDataResponse? danhSachDoanhNghiepDataResponse;
  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;

  FilterDrawer({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends BaseScreenStateActive<FilterDrawer> {
  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;
  late DanhSachDoanhNghiepBloc danhSachDoanhNghiepBloc;
  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
    danhSachDoanhNghiepBloc = DanhSachDoanhNghiepBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
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
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(children: [
          Expanded(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text("Tiêu chí tìm kiếm thêm"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachTinhTpBloc,
                    child: BlocListener<DanhSachTinhTpBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachTinhTpBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachTinhTpResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachTinhTp(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachTinhTp(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachQuanHuyenBloc,
                    child: BlocListener<DanhSachQuanHuyenBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachQuanHuyenBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachQuanHuyenResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachQuanHuyen(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachQuanHuyen(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachDoanhNghiepBloc,
                    child: BlocListener<DanhSachDoanhNghiepBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachDoanhNghiepBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachDoanhNghiepResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachDoanhNghiep(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachDoanhNghiep(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachMucLuongBloc,
                    child: BlocListener<DanhSachMucLuongBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachMucLuongBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachMucLuongResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachMucLuong(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachMucLuong(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachKinhNghiemBloc,
                    child: BlocListener<DanhSachKinhNghiemBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachKinhNghiemBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachKinhNghiemResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachKinhNghiem(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachKinhNghiem(
                                    context, [])),
                      ),
                    )),
              ),
            ],
          )),
        ]),
      );

  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    return DropdownSearch<DanhSachTinhTpDataResponse>(
      popupProps: _buildPopupProps(context),
      selectedItem: widget.danhSachTinhTpDataResponse,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
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
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Tình thành phố"),
    );
  }

  Widget _buildViewSearchDanhSachQuanHuyen(
      BuildContext context, List<DanhSachQuanHuyenDataResponse> list) {
    return DropdownSearch<DanhSachQuanHuyenDataResponse>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      selectedItem: widget.danhSachQuanHuyenDataResponse,
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachQuanHuyenDataResponse u) =>
          u.regionalName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachQuanHuyenDataResponse? data) {
        if (widget.danhSachQuanHuyenDataResponse != data) {
          widget.danhSachQuanHuyenDataResponse = data;
          widget.data.quanHuyen = data?.regionalID;
          widget.data.doanhNghiep = null;
          widget.danhSachDoanhNghiepDataResponse = null;
          danhSachDoanhNghiepBloc.add(DanhSachDoanhNghiepEvent(
              request: DanhSachDoanhNghiepRequest(
                  obj: DanhSachDoanhNghiepDataRequest(
                      tinhTp: widget.data.tinhTp,
                      quanHuyen: widget.data.quanHuyen))));
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Quận huyện"),
    );
  }

  Widget _buildViewSearchDanhSachDoanhNghiep(
      BuildContext context, List<DanhSachDoanhNghiepDataResponse> list) {
    return DropdownSearch<DanhSachDoanhNghiepDataResponse>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      selectedItem: widget.danhSachDoanhNghiepDataResponse,
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachDoanhNghiepDataResponse u) =>
          u.businessVn.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachDoanhNghiepDataResponse? data) {
        if (widget.danhSachDoanhNghiepDataResponse != data) {
          widget.danhSachDoanhNghiepDataResponse = data;
          widget.data.doanhNghiep = data?.doanhNghiepID;
        }
      },
      dropdownDecoratorProps: _buildDropDownDecoratorProps(context, "Công ty"),
    );
  }

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    return DropdownSearch<DanhSachKinhNghiemDataResponse>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      selectedItem: widget.danhSachKinhNghiemDataResponse,
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachKinhNghiemDataResponse u) =>
          u.experienceName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachKinhNghiemDataResponse? data) {
        if (widget.danhSachKinhNghiemDataResponse != data) {
          widget.danhSachKinhNghiemDataResponse = data;
          widget.data.kinhNghiem = data?.experienceID;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Kinh nghiệm"),
    );
  }

  Widget _buildViewSearchDanhSachMucLuong(
      BuildContext context, List<DanhSachMucLuongDataResponse> list) {
    return DropdownSearch<DanhSachMucLuongDataResponse>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      selectedItem: widget.danhSachMucLuongDataResponse,
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachMucLuongDataResponse u) =>
          u.salaryName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachMucLuongDataResponse? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          widget.danhSachMucLuongDataResponse = data;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Mức lương"),
    );
  }

  PopupProps<T> _buildPopupProps<T>(BuildContext context) => PopupProps.dialog(
      showSearchBox: true,
      emptyBuilder: (context, searchEntry) => const Center(
          child:
              Text('Không có dữ liệu', style: TextStyle(color: Colors.blue))),
      searchFieldProps: const TextFieldProps(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
          hintText: "Tìm kiếm...",
        ),
      ));

  DropDownDecoratorProps _buildDropDownDecoratorProps(
          BuildContext context, String title) =>
      DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            labelText: title, hintText: "Vui lòng chọn ${title.toLowerCase()}"),
      );

  ClearButtonProps _buildClearButtonProps() => const ClearButtonProps(
      isVisible: true, padding: EdgeInsets.zero, color: Colors.black);
}
