
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

class BusinessJobDescriptionTab extends BasePageWidget {
  final WorkSearchByUserNameDataResponse? data;

  const BusinessJobDescriptionTab({super.key, this.data});

  @override
  State<StatefulWidget> createState() => BusinessJobDescriptionTabState();
}

class BusinessJobDescriptionTabState extends BasePageKeepState<BusinessJobDescriptionTab> {
  TextEditingController motaController = TextEditingController();
  TextEditingController yeuCauCVController = TextEditingController();
  TextEditingController yeuCauHoSoController = TextEditingController();
  TextEditingController quyenLoiController = TextEditingController();

  @override
  void callApi() {
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
          icon: FontAwesomeIcons.noteSticky,
          controller: motaController,
          minLines: 10,
          maxLines: 10,
          maxLength: 2000,
          hintText: "Mô tả công việc",
          labelText: "Mô tả công việc",
          helperText: "Ví dụ: abc",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.noteSticky,
          controller: yeuCauCVController,
          minLines: 10,
          maxLines: 10,
          maxLength: 2000,
          hintText: "Yêu cầu công việc",
          labelText: "Yêu cầu công việc",
          helperText: "Ví dụ: abc",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.noteSticky,
          controller: yeuCauHoSoController,
          minLines: 10,
          maxLines: 10,
          maxLength: 2000,
          hintText: "Yêu cầu hồ sơ",
          labelText: "Yêu cầu hồ sơ",
          helperText: "Ví dụ: abc",
          required: true,
          validator: (value) {
            return null;
          },
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.noteSticky,
          controller: quyenLoiController,
          minLines: 10,
          maxLines: 10,
          maxLength: 2000,
          hintText: "Quyền lợi người lao động",
          labelText: "Quyền lợi người lao động",
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
