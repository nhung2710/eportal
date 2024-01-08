
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

class BusinessJobContractTab extends BasePageWidget {
  final WorkSearchByUserNameDataResponse? data;

  const BusinessJobContractTab({super.key, this.data});

  @override
  State<StatefulWidget> createState() => BusinessJobContractTabState();
}

class BusinessJobContractTabState extends BasePageKeepState<BusinessJobContractTab> {
  TextEditingController tenNguoiLHController = TextEditingController();
  TextEditingController diaChiNguoiLHController = TextEditingController();
  TextEditingController dienThoaiNguoiLHController = TextEditingController();
  TextEditingController emailNguoiLHController = TextEditingController();
  TextEditingController ghiChuController = TextEditingController();

  @override
  void callApi() {
    // TODO: implement callApi
  }

  void callApiQuanHuyen() {
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
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
          icon: FontAwesomeIcons.userTag,
          controller: tenNguoiLHController,
          hintText: "Người liên hệ",
          labelText: "Người liên hệ",
          helperText: "Ví dụ: Nguyễn Văn A",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.addressCard,
          controller: diaChiNguoiLHController,
          hintText: "Địa chỉ",
          labelText: "Địa chỉ",
          helperText: "Ví dụ: Số 1 đường A",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.mobile,
          controller: dienThoaiNguoiLHController,
          hintText: "Số điện thoại",
          labelText: "Số điện thoại",
          helperText: "Ví dụ: 000000000",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.envelope,
          controller: emailNguoiLHController,
          hintText: "Email",
          labelText: "Email",
          helperText: "Ví dụ: abc@gmail.com",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.noteSticky,
          controller: ghiChuController,
          minLines: 10,
          maxLines: 10,
          maxLength: 500,
          hintText: "Ghi chú",
          labelText: "Ghi chú",
          helperText: "Ví dụ: abc",
          required: true,
          validator: (value) {
            return null;
          },
        ),
      ],
    ),
  );

}
