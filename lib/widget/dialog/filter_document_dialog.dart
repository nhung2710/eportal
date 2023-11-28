import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_co_quan_ban_hanh_event.dart';
import 'package:eportal/event/common_new/danh_sach_loai_van_ban_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_co_quan_ban_hanh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_loai_van_ban_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_co_quan_ban_hanh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_loai_van_ban_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/document_list_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_co_quan_ban_hanh_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_linh_vuc_van_ban_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_loai_van_ban_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/common_new/danh_sach_co_quan_ban_hanh_bloc.dart';
import '../../bloc/common_new/danh_sach_linh_vuc_van_ban_bloc.dart';
import '../../bloc/common_new/danh_sach_loai_van_ban_bloc.dart';
import '../../event/common_new/danh_sach_linh_vuc_van_ban_event.dart';
import '../../extension/string_extension.dart';
import '../../model/api/request/common_new/danh_sach_linh_vuc_van_ban_request.dart';
import '../../model/api/request/common_new/data/danh_sach_linh_vuc_van_ban_data_request.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GroupTypeDocument {
  String name;
  String search = "";
  int id;

  GroupTypeDocument({required this.id, required this.name}) {
    search = name.getValueSearch();
  }

  bool filter(String filter) {
    return filter.isNullOrWhiteSpace() ||
        search.contains(filter.getValueSearch());
  }
}

class FilterDocumentDialog extends BasePage {
  DocumentListDataRequest data;
  DanhSachLinhVucVanBanDataResponse? danhSachLinhVucVanBanDataResponse;
  DanhSachLoaiVanBanDataResponse? danhSachLoaiVanBanDataResponse;
  DanhSachCoQuanBanHanhDataResponse? danhSachCoQuanBanHanhDataResponse;
  GroupTypeDocument? groupTypeDocument;

  final VoidCallback onPressed;

  FilterDocumentDialog(
      {super.key, required this.data, required this.onPressed});

  @override
  State<StatefulWidget> createState() => FilterDocumentDialogState();
}

class FilterDocumentDialogState extends BaseScreenState<FilterDocumentDialog> {
  DanhSachLinhVucVanBanBloc danhSachLinhVucVanBanBloc =
      DanhSachLinhVucVanBanBloc();

  DanhSachLoaiVanBanBloc danhSachLoaiVanBanBloc = DanhSachLoaiVanBanBloc();
  DanhSachCoQuanBanHanhBloc danhSachCoQuanBanHanhBloc =
      DanhSachCoQuanBanHanhBloc();
  List<GroupTypeDocument> groupTypeDocuments = [];

  @override
  void initDataLoading() {
    groupTypeDocuments = [
      GroupTypeDocument(id: 1, name: "Văn bản của Đảng"),
      GroupTypeDocument(id: 0, name: "Văn bản quy phạm pháp luật")
    ];
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    danhSachLinhVucVanBanBloc.add(DanhSachLinhVucVanBanEvent(
        request: DanhSachLinhVucVanBanRequest(
            obj: DanhSachLinhVucVanBanDataRequest())));
    danhSachLoaiVanBanBloc.add(DanhSachLoaiVanBanEvent(
        request:
            DanhSachLoaiVanBanRequest(obj: DanhSachLoaiVanBanDataRequest())));
    danhSachCoQuanBanHanhBloc.add(DanhSachCoQuanBanHanhEvent(
        request: DanhSachCoQuanBanHanhRequest(
            obj: DanhSachCoQuanBanHanhDataRequest())));
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
                child: _buildViewSearchGroupTypeDocument(
                    context, groupTypeDocuments),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachLinhVucVanBanBloc,
                    child: BlocListener<DanhSachLinhVucVanBanBloc,
                        DataMultiState<DanhSachLinhVucVanBanDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachLinhVucVanBanDataResponse>
                              state) {},
                      child: BlocBuilder<DanhSachLinhVucVanBanBloc,
                          DataMultiState<DanhSachLinhVucVanBanDataResponse>>(
                        builder: (BuildContext context,
                                DataMultiState<
                                        DanhSachLinhVucVanBanDataResponse>
                                    state) =>
                            _buildViewSearchDanhSachLinhVucVanBan(
                                context, state.data ?? []),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachLoaiVanBanBloc,
                    child: BlocListener<DanhSachLoaiVanBanBloc,
                        DataMultiState<DanhSachLoaiVanBanDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachLoaiVanBanDataResponse>
                              state) {},
                      child: BlocBuilder<DanhSachLoaiVanBanBloc,
                          DataMultiState<DanhSachLoaiVanBanDataResponse>>(
                        builder: (BuildContext context,
                                DataMultiState<DanhSachLoaiVanBanDataResponse>
                                    state) =>
                            _buildViewSearchDanhSachLoaiVanBan(
                                context, state.data ?? []),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachCoQuanBanHanhBloc,
                    child: BlocListener<DanhSachCoQuanBanHanhBloc,
                        DataMultiState<DanhSachCoQuanBanHanhDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachCoQuanBanHanhDataResponse>
                              state) {},
                      child: BlocBuilder<DanhSachCoQuanBanHanhBloc,
                          DataMultiState<DanhSachCoQuanBanHanhDataResponse>>(
                        builder: (BuildContext context,
                                DataMultiState<
                                        DanhSachCoQuanBanHanhDataResponse>
                                    state) =>
                            _buildViewSearchDanhSachCoQuanBanHanh(
                                context, state.data ?? []),
                      ),
                    )),
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

  Widget _buildViewSearchDanhSachCoQuanBanHanh(
      BuildContext context, List<DanhSachCoQuanBanHanhDataResponse> list) {
    return DropdownSearch<DanhSachCoQuanBanHanhDataResponse>(
      popupProps: _buildPopupProps(context),
      selectedItem: widget.danhSachCoQuanBanHanhDataResponse,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachCoQuanBanHanhDataResponse u) =>
          u.docUnitName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachCoQuanBanHanhDataResponse? data) {
        if (widget.danhSachCoQuanBanHanhDataResponse != data) {
          widget.danhSachCoQuanBanHanhDataResponse = data;
          widget.data.coQuanBanHanh = data?.docUnitID;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Cơ quan ban hành"),
    );
  }

  Widget _buildViewSearchDanhSachLinhVucVanBan(
      BuildContext context, List<DanhSachLinhVucVanBanDataResponse> list) {
    return DropdownSearch<DanhSachLinhVucVanBanDataResponse>(
      popupProps: _buildPopupProps(context),
      selectedItem: widget.danhSachLinhVucVanBanDataResponse,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachLinhVucVanBanDataResponse u) =>
          u.docFieldName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachLinhVucVanBanDataResponse? data) {
        if (widget.danhSachLinhVucVanBanDataResponse != data) {
          widget.danhSachLinhVucVanBanDataResponse = data;
          widget.data.linhVucVanBan = data?.docFieldID;
        }
      },
      dropdownDecoratorProps: _buildDropDownDecoratorProps(context, "Lĩnh vực"),
    );
  }

  Widget _buildViewSearchDanhSachLoaiVanBan(
      BuildContext context, List<DanhSachLoaiVanBanDataResponse> list) {
    return DropdownSearch<DanhSachLoaiVanBanDataResponse>(
      popupProps: _buildPopupProps(context),
      selectedItem: widget.danhSachLoaiVanBanDataResponse,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachLoaiVanBanDataResponse u) =>
          u.docTypeName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachLoaiVanBanDataResponse? data) {
        if (widget.danhSachLoaiVanBanDataResponse != data) {
          widget.danhSachLoaiVanBanDataResponse = data;
          widget.data.loaiVanBan = data?.docTypeID;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Loại văn bản"),
    );
  }

  Widget _buildViewSearchGroupTypeDocument(
      BuildContext context, List<GroupTypeDocument> list) {
    return DropdownSearch<GroupTypeDocument>(
      popupProps: _buildPopupProps(context),
      selectedItem: widget.groupTypeDocument,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (GroupTypeDocument u) => u.name,
      onChanged: (GroupTypeDocument? data) {
        if (widget.groupTypeDocument != data) {
          widget.groupTypeDocument = data;
          widget.data.nhomVanBan = data?.id;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Loại văn bản"),
    );
  }
}
