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

  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachDoanhNghiepDataResponse? danhSachDoanhNghiepDataResponse;
  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;

  FilterJobDialog({super.key, required this.data}) {}

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

  @override
  void initState() {
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
    super.initState();
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
                        DataState<List<DanhSachTinhTpDataResponse>>>(
                      listener: (BuildContext context,
                          DataState<List<DanhSachTinhTpDataResponse>> state) {},
                      child: BlocBuilder<DanhSachTinhTpBloc,
                          DataState<List<DanhSachTinhTpDataResponse>>>(
                        builder: (BuildContext context,
                                DataState<List<DanhSachTinhTpDataResponse>>
                                    state) =>
                            handleDataState<List<DanhSachTinhTpDataResponse>>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachTinhTp(
                                        context, state ?? []),
                                initWidget: _buildViewSearchDanhSachTinhTp(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachQuanHuyenBloc,
                    child: BlocListener<DanhSachQuanHuyenBloc,
                        DataState<List<DanhSachQuanHuyenDataResponse>>>(
                      listener: (BuildContext context,
                          DataState<List<DanhSachQuanHuyenDataResponse>>
                              state) {},
                      child: BlocBuilder<DanhSachQuanHuyenBloc,
                          DataState<List<DanhSachQuanHuyenDataResponse>>>(
                        builder: (BuildContext context,
                                DataState<List<DanhSachQuanHuyenDataResponse>>
                                    state) =>
                            handleDataState<
                                    List<DanhSachQuanHuyenDataResponse>>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachQuanHuyen(
                                        context, state ?? []),
                                initWidget: _buildViewSearchDanhSachQuanHuyen(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachDoanhNghiepBloc,
                    child: BlocListener<DanhSachDoanhNghiepBloc,
                        DataState<List<DanhSachDoanhNghiepDataResponse>>>(
                      listener: (BuildContext context,
                          DataState<List<DanhSachDoanhNghiepDataResponse>>
                              state) {},
                      child: BlocBuilder<DanhSachDoanhNghiepBloc,
                          DataState<List<DanhSachDoanhNghiepDataResponse>>>(
                        builder: (BuildContext context,
                                DataState<List<DanhSachDoanhNghiepDataResponse>>
                                    state) =>
                            handleDataState<
                                    List<DanhSachDoanhNghiepDataResponse>>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachDoanhNghiep(
                                        context, state ?? []),
                                initWidget: _buildViewSearchDanhSachDoanhNghiep(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachMucLuongBloc,
                    child: BlocListener<DanhSachMucLuongBloc,
                        DataState<List<DanhSachMucLuongDataResponse>>>(
                      listener: (BuildContext context,
                          DataState<List<DanhSachMucLuongDataResponse>>
                              state) {},
                      child: BlocBuilder<DanhSachMucLuongBloc,
                          DataState<List<DanhSachMucLuongDataResponse>>>(
                        builder: (BuildContext context,
                                DataState<List<DanhSachMucLuongDataResponse>>
                                    state) =>
                            handleDataState<List<DanhSachMucLuongDataResponse>>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachMucLuong(
                                        context, state ?? []),
                                initWidget: _buildViewSearchDanhSachMucLuong(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachKinhNghiemBloc,
                    child: BlocListener<DanhSachKinhNghiemBloc,
                        DataState<List<DanhSachKinhNghiemDataResponse>>>(
                      listener: (BuildContext context,
                          DataState<List<DanhSachKinhNghiemDataResponse>>
                              state) {},
                      child: BlocBuilder<DanhSachKinhNghiemBloc,
                          DataState<List<DanhSachKinhNghiemDataResponse>>>(
                        builder: (BuildContext context,
                                DataState<List<DanhSachKinhNghiemDataResponse>>
                                    state) =>
                            handleDataState<
                                    List<DanhSachKinhNghiemDataResponse>>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachKinhNghiem(
                                        context, state ?? []),
                                initWidget: _buildViewSearchDanhSachKinhNghiem(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  child: DefaultButton(
                    text: 'Tìm kiếm',
                    onPressed: () => Navigator.of(context).pop(),
                  )),
            ],
          ),
        ),
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
          widget.data.tinhTp = data?.regionalID ?? 0;
          widget.data.quanHuyen = 0;
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
          u.regionalName.supportHtml(),
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
          u.businessVn.supportHtml(),
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
          u.experienceName.supportHtml(),
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
          u.salaryName.supportHtml(),
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
          child: Text('Không có dữ liệu',
              style: TextStyle(color: AppColor.colorOfIcon))),
      searchFieldProps: const TextFieldProps(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10),
          hintText: "Tìm kiếm...",
        ),
      ));

  DropDownDecoratorProps _buildDropDownDecoratorProps(
          BuildContext context, String title) =>
      DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            labelText: title,
            hintText: "Vui lòng chọn ${title.toLowerCase()}",
            labelStyle:
                AppTextStyle.titlePage.copyWith(color: AppColor.colorOfIcon),
            hintStyle:
                AppTextStyle.title.copyWith(color: AppColor.colorOfHintText)),
        baseStyle: AppTextStyle.titlePage.copyWith(color: AppColor.colorOfIcon),
      );

  ClearButtonProps _buildClearButtonProps() => const ClearButtonProps(
      isVisible: true,
      padding: EdgeInsets.zero,
      color: AppColor.colorOfHintText);
}
