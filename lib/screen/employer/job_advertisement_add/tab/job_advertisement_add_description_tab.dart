//
// Created by BlackRose on 19/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/date_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobAdvertisementAddDescriptionTab extends BasePage {
  const JobAdvertisementAddDescriptionTab({super.key});

  @override
  State<StatefulWidget> createState() =>
      JobAdvertisementAddDescriptionTabState();
}

class JobAdvertisementAddDescriptionTabState
    extends BaseScreenStateActive<JobAdvertisementAddDescriptionTab> {
  TextEditingController motaController = TextEditingController();
  TextEditingController yeuCauCVController = TextEditingController();
  TextEditingController yeuCauHoSoController = TextEditingController();
  TextEditingController quyenLoiController = TextEditingController();
  TextEditingController ghiChuController = TextEditingController();

  @override
  void initBloc() {}

  @override
  void initDataLoading() {
    callApi();
    // TODO: implement initDataLoading
    super.initDataLoading();
  }

  @override
  void callApi() {
    super.callApi();
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
            child: FieldInput(
              controller: motaController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 5,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Mô tả",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: yeuCauCVController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 5,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Yêu cầu công việc",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: yeuCauHoSoController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 5,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Yêu cầu hồ sơ",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: quyenLoiController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 5,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Quyền lợi",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: ghiChuController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 5,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Ghi chú",
            ),
          ),
        ],
      );
}
