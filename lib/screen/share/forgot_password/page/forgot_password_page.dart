import 'package:eportal/constant/application_regex_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/screen/share/sign_up/page/sign_up_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../../../extension/input_decoration_extension.dart';
import '../../../../style/app_color.dart';
import '../../../../widget/input/capcha_input.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ForgotPasswordPage extends BasePage {
  const ForgotPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BasePageState<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Quên mật khẩu";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

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
                  return 'Tài khoản không được để trống';
                }
                return null;
              },
              hintText: 'Tài khoản',
              icon: Icons.account_circle,
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
            child: CapchaInput(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => _signUp(context),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.colorOfIcon),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Quên mật khẩu'),
                ),
                onPressed: () => _signUp(context),
              )),
        ],
      );

  _signUp(BuildContext context) {
    if (isValid()) {
      loadDataDemo().then((value) {
        showCenterMessage(
                "Hệ thống đã gửi mật khẩu mới về email của bạn vui lòng kiểm tra lại")
            .then((value) => nextPage((context) => const SignUpPage()));
      });
    }
  }
}
