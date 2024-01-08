
//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_nganh_nghe_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/checkbox/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/danh_sach_nganh_nghe_event.dart';
import '../../../../event/common_new/danh_sach_quan_huyen_event.dart';
import '../../../../event/common_new/danh_sach_tinh_tp_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_nganh_nghe_request.dart';
import '../../../../model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_nganh_nghe_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import '../../../base/page_state/base_page_keep_state.dart';
import '../../../widget/default_date_text_form_field.dart';
import '../../../widget/default_select_item_data_response.dart';

class BusinessJobBasicTab extends BasePageWidget {
  final WorkSearchByUserNameDataResponse? data;

  const BusinessJobBasicTab({super.key, this.data});

  @override
  State<StatefulWidget> createState() => BusinessJobBasicTabState();
}

class BusinessJobBasicTabState extends BasePageKeepState<BusinessJobBasicTab> {
  TextEditingController tieuDeController = TextEditingController();
  TextEditingController hanNopHoSoController = TextEditingController();
  TextEditingController hinhThucNopController = TextEditingController();
  TextEditingController dangTuNgayController = TextEditingController();
  TextEditingController dangDenNgayController = TextEditingController();
  bool? tinNoiBat = false;
  bool? dauThongTinDN = false;
  bool? dangGap = false;
  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  DanhSachTinhTpEvent danhSachTinhTpEvent = DanhSachTinhTpEvent(request: DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest()));
  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  @override
  void callApi() {
    // TODO: implement callApi
    danhSachTinhTpBloc.add(danhSachTinhTpEvent);
  }


  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachTinhTpBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: ListView(
      children: [
        DefaultTextFormField(
          icon: FontAwesomeIcons.tags,
          controller: tieuDeController,
          hintText: "Tiêu đề",
          labelText: "Tiêu đề",
          helperText: "Ví dụ: Cần tìm việc",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: CustomCheckbox(
            title: "Tin nổi bật",
            check: tinNoiBat,
            onChanged: (value) => tinNoiBat = value,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: CustomCheckbox(
            title: "Đầu thông tin doanh nghiệp",
            check: dauThongTinDN,
            onChanged: (value) => dauThongTinDN = value,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: CustomCheckbox(
            title: "Đăng gấp",
            check: dangGap,
            onChanged: (value) => dangGap = value,
          ),
        ),
        DefaultDateTextFormField(
          controller: hanNopHoSoController,
          hintText: "Hạn nộp",
          labelText: "Hạn nộp",
          helperText: "Ví dụ: 01/01/2024",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultDateTextFormField(
          controller: dangTuNgayController,
          hintText: "Ngày đăng",
          labelText: "Ngày đăng",
          helperText: "Ví dụ: 01/01/2024",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultDateTextFormField(
          controller: dangDenNgayController,
          hintText: "Ngày hết hạn",
          labelText: "Ngày hết hạn",
          helperText: "Ví dụ: 01/01/2024",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: BlocProvider(
              create: (_) => danhSachTinhTpBloc,
              child: BlocListener<DanhSachTinhTpBloc,
                  DataMultiState<DanhSachTinhTpDataResponse>>(
                listener: (BuildContext context,
                    DataMultiState<DanhSachTinhTpDataResponse>
                    state) {},
                child: BlocBuilder<DanhSachTinhTpBloc,
                    DataMultiState<DanhSachTinhTpDataResponse>>(
                  builder: (BuildContext context,
                      DataMultiState<DanhSachTinhTpDataResponse>
                      state) =>
                      _buildViewSearchDanhSachTinhTp(
                          context, state.data),
                ),
              )),
        ),
      ],
    ),
  );

  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    if (widget.data != null && danhSachTinhTpDataResponse == null) {
      danhSachTinhTpDataResponse = list
          .where((element) => element.regionalID == widget.data!.tinhTP)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachTinhTpDataResponse>(
        icon: FontAwesomeIcons.city,
        selectedItem: danhSachTinhTpDataResponse,
        list: list,
        itemAsString: (DanhSachTinhTpDataResponse u) =>
            u.regionalName.supportHtml(),
        onChanged: (DanhSachTinhTpDataResponse? data) {
          if (danhSachTinhTpDataResponse != data) {
            danhSachTinhTpDataResponse = data;
          }
        },
        labelText: "Tỉnh/Thành phố",
        hintText: "Tỉnh/Thành phố",
        title: "Tỉnh/Thành phố");
  }

}
