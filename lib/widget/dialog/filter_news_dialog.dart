import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuyen_muc_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuyen_muc_request.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuyen_muc_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/search_request_data.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuyen_muc_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/common_new/danh_sach_chuyen_muc_bloc.dart';
import '../../extension/string_extension.dart';
import '../../model/api/request/common_new/data/news_search_data_request.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FilterNewsDialog extends BasePage {
  NewsSearchDataRequest data;
  DanhSachChuyenMucDataResponse? danhSachChuyenMucDataResponse;
  final VoidCallback onPressed;

  FilterNewsDialog({super.key, required this.data, required this.onPressed});

  @override
  State<StatefulWidget> createState() => FilterNewsDialogState();
}

class FilterNewsDialogState extends BaseScreenState<FilterNewsDialog> {
  DanhSachChuyenMucBloc danhSachChuyenMucBloc = DanhSachChuyenMucBloc();

  @override
  void initDataLoading() {
    danhSachChuyenMucBloc = DanhSachChuyenMucBloc();
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    danhSachChuyenMucBloc.add(DanhSachChuyenMucEvent(
        request:
            DanhSachChuyenMucRequest(obj: DanhSachChuyenMucDataRequest())));
    // TODO: implement callApi
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
                    create: (_) => danhSachChuyenMucBloc,
                    child: BlocListener<DanhSachChuyenMucBloc,
                        DataMultiState<DanhSachChuyenMucDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachChuyenMucDataResponse>
                              state) {},
                      child: BlocBuilder<DanhSachChuyenMucBloc,
                          DataMultiState<DanhSachChuyenMucDataResponse>>(
                        builder: (BuildContext context,
                                DataMultiState<DanhSachChuyenMucDataResponse>
                                    state) =>
                            _buildViewSearchDanhSachChuyenMuc(
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

  Widget _buildViewSearchDanhSachChuyenMuc(
      BuildContext context, List<DanhSachChuyenMucDataResponse> list) {
    return DropdownSearch<DanhSachChuyenMucDataResponse>(
      popupProps: _buildPopupProps(context),
      selectedItem: widget.danhSachChuyenMucDataResponse,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachChuyenMucDataResponse u) =>
          u.categoryName.supportHtml(),
      onChanged: (DanhSachChuyenMucDataResponse? data) {
        if (widget.danhSachChuyenMucDataResponse != data) {
          widget.danhSachChuyenMucDataResponse = data;
          widget.data.chuyenMuc = data?.categoryID;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Loại tin tức"),
    );
  }
}
