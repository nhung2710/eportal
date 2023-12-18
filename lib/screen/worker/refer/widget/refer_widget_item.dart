//
// Created by BlackRose on 18/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/admin/data/job_user_refer_add_data_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_list_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class ReferWidgetItem extends StatefulWidget {
  JobUserReferAddDataRequest data;
  final VoidCallback onPressed;

  ReferWidgetItem({super.key, required this.data, required this.onPressed});

  @override
  State<StatefulWidget> createState() => ReferWidgetItemSate();
}

class ReferWidgetItemSate extends State<ReferWidgetItem> {
  TextEditingController hoTenEditingController = TextEditingController();
  TextEditingController chucVuEditingController = TextEditingController();
  TextEditingController noiCongTacEditingController = TextEditingController();
  TextEditingController soDienThoaiEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController moiquanheEditingController = TextEditingController();

  @override
  void initState() {
    hoTenEditingController.text =
        widget.data.hoTen.replaceWhenNullOrWhiteSpace();
    chucVuEditingController.text =
        widget.data.chucVu.replaceWhenNullOrWhiteSpace();
    noiCongTacEditingController.text =
        widget.data.noiCongTac.replaceWhenNullOrWhiteSpace();
    soDienThoaiEditingController.text =
        widget.data.soDienThoai.replaceWhenNullOrWhiteSpace();
    emailEditingController.text =
        widget.data.email.replaceWhenNullOrWhiteSpace();
    moiquanheEditingController.text =
        widget.data.moiQuanHe.replaceWhenNullOrWhiteSpace();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Card(
        elevation: AppElevation.sizeOfNormal,
        color: AppColor.colorOfApp,
        shadowColor: AppColor.colorOfIcon,
        borderOnForeground: false,
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FieldInput(
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    widget.data.hoTen = text;
                  },
                  hintText: "Họ và tên",
                  controller: hoTenEditingController,
                  icon: FontAwesomeIcons.userTag,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FieldInput(
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      widget.data.chucVu = text;
                    },
                    hintText: "Chức vụ",
                    controller: chucVuEditingController,
                    icon: FontAwesomeIcons.userTie,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FieldInput(
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      widget.data.noiCongTac = text;
                    },
                    hintText: "Nơi công tác",
                    controller: noiCongTacEditingController,
                    icon: FontAwesomeIcons.city,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FieldInput(
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      widget.data.soDienThoai = text;
                    },
                    hintText: "Số điện thoại",
                    controller: soDienThoaiEditingController,
                    icon: FontAwesomeIcons.phone,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FieldInput(
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      widget.data.email = text;
                    },
                    hintText: "Email",
                    controller: emailEditingController,
                    icon: FontAwesomeIcons.envelope,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FieldInput(
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      widget.data.moiQuanHe = text;
                    },
                    hintText: "Mối quan hệ",
                    controller: moiquanheEditingController,
                    icon: FontAwesomeIcons.addressCard,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: DefaultButton(
                      backgroundColor: Colors.red,
                      text: 'Xoá',
                      onPressed: widget.onPressed,
                    )),
              ]),
        ),
      );
}
