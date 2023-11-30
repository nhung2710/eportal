import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ContractPage extends BasePage {
  const ContractPage({super.key});

  @override
  State<StatefulWidget> createState() => _ContractPageState();
}

class _ContractPageState extends BasePageState<ContractPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Liên hệ";

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: usernameController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Tên của bạn không được để trống';
                }
                return null;
              },
              hintText: 'Tên của bạn',
              icon: Icons.person,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: emailController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              hintText: 'Địa chỉ thư điện tử',
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ thư điện tử không được để trống';
                }
                return null;
              },
              icon: Icons.email,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: phoneController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
                  return 'Số điện thoại không được để trống';
                }
                return null;
              },
              icon: Icons.smartphone,
              hintText: "Điện thoại",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: contentController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 500,
              minLines: 10,
              maxLines: 20,
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
                  return 'Nội dung không được để trống';
                }
                return null;
              },
              icon: Icons.description,
              hintText: "Nội dung",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CapchaInput(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => _signUp(context),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: DefaultButton(
                text: 'Quên mật khẩu',
                onPressed: () => _signUp(context),
              )),
        ],
      );

  _signUp(BuildContext context) {
    if (isValid()) {
      showCenterMessage(
              "Hệ thống đã gửi mật khẩu mới về email của bạn vui lòng kiểm tra lại")
          .then((value) => backPage());
    }
  }
}
