//
// Created by BlackRose on 19/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobAdvertisementEditContractTab extends BasePage {
  JobAdvertisementEditContractTab({super.key});

  @override
  State<StatefulWidget> createState() => JobAdvertisementEditContractTabState();
}

class JobAdvertisementEditContractTabState
    extends BaseScreenStateActive<JobAdvertisementEditContractTab> {
  TextEditingController tenNguoiLHController = TextEditingController();
  TextEditingController diaChiNguoiLHController = TextEditingController();
  TextEditingController dienThoaiNguoiLHController = TextEditingController();
  TextEditingController emailNguoiLHController = TextEditingController();
  TextEditingController ghiChuController = TextEditingController();

  @override
  void initBloc() {}

  @override
  void initDataLoading() {
    callApi();
    // TODO: implement initDataLoading
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
  void callApi() {}

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
              controller: tenNguoiLHController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              hintText: 'Người liên hệ',
              icon: FontAwesomeIcons.userTag,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: diaChiNguoiLHController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              hintText: 'Địa chỉ',
              icon: FontAwesomeIcons.addressCard,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: dienThoaiNguoiLHController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              hintText: 'Điện thoại',
              icon: FontAwesomeIcons.mobile,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: emailNguoiLHController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              hintText: 'Email',
              icon: FontAwesomeIcons.envelope,
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
              hintText: "Ghi chú nội dung đăng tin tuyển dụng",
            ),
          ),
        ],
      );
}
