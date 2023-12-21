//
// Created by BlackRose on 19/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';

class JobAdvertisementEditDescriptionTab extends BasePage {
  const JobAdvertisementEditDescriptionTab({super.key});

  @override
  State<StatefulWidget> createState() =>
      JobAdvertisementEditDescriptionTabState();
}

class JobAdvertisementEditDescriptionTabState
    extends BaseScreenStateActive<JobAdvertisementEditDescriptionTab> {
  TextEditingController motaController = TextEditingController();
  TextEditingController yeuCauCVController = TextEditingController();
  TextEditingController yeuCauHoSoController = TextEditingController();
  TextEditingController quyenLoiController = TextEditingController();

  @override
  void initBloc() {}

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {}

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
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
              hintText: "Mô tả công việc",
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
              hintText: "Quyền lợi người lao động",
            ),
          ),
        ],
      );
}
