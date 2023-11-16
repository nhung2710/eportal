import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/share/sign_in/page/sign_in_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../../../extension/input_decoration_extension.dart';
import '../../../../style/app_color.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SignUpPage extends BasePage {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Đăng ký tài khoản";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Image.asset(
              'assets/images/Logo.jpg',
              alignment: Alignment.center,
              height: 125,
              width: 125,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: fullNameController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Họ và tên không được để trống';
                }
                return null;
              },
              decoration: const InputDecoration().defaultInputDecoration(
                  hintText: "Họ và tên", iconData: Icons.account_box),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: emailController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ thư điện tử không được để trống';
                }
                return null;
              },
              decoration: const InputDecoration().defaultInputDecoration(
                  hintText: "Địa chỉ thư điện tử", iconData: Icons.email),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: phoneController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Số điện thoại không được để trống';
                }
                return null;
              },
              decoration: const InputDecoration().defaultInputDecoration(
                  hintText: "Số điện thoại", iconData: Icons.phone),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: nameController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Tài khoản không được để trống';
                }
                return null;
              },
              decoration: const InputDecoration().defaultInputDecoration(
                  hintText: "Tài khoản", iconData: Icons.account_circle),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              obscureText: true,
              controller: passwordController,
              maxLength: 50,
              textInputAction: TextInputAction.done,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Mật khẩu không được để trống';
                }
                return null;
              },
              onFieldSubmitted: (value) => _registerAccount(context),
              decoration: const InputDecoration().defaultInputDecoration(
                  hintText: "Mật khẩu", iconData: Icons.password),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Đăng ký'),
                ),
                onPressed: () => _registerAccount(context),
              )),
        ],
      );

  _registerAccount(BuildContext context) {
    if (isValid()) {
      loadDataDemo().then((value) {
        GlobalApplication().Preferences.setString(
            ApplicationConstant.REGISTER_USER_NAME, nameController.text);
        GlobalApplication().Preferences.setString(
            ApplicationConstant.REGISTER_USER_PASSWORD,
            passwordController.text);
        showCenterMessage("Bạn đã tạo tài khoản thành công")
            .then((value) => nextPage((context) => const SignInPage()));
      });
    }
  }
}
