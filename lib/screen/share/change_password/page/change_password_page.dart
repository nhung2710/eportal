import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/password_input.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ChangePasswordPage extends BasePage {
  const ChangePasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends BasePageState<ChangePasswordPage> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Thay đổi mật khẩu";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  void callApi() {
    // TODO: implement callApi
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
  }

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: PasswordInput(
              controller: oldPasswordController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
                  return 'Mật khẩu cũ không được để trống';
                }
                return null;
              },
              hintText: 'Mật khẩu cũ',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: PasswordInput(
                obscureText: true,
                controller: newPasswordController,
                maxLength: 50,
                textInputAction: TextInputAction.next,
                validator: (text) {
                  if (text.isNullOrWhiteSpace()) {
                    return 'Mật khẩu mới không được để trống';
                  }
                  return null;
                },
                hintText: 'Mật khẩu mới'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: PasswordInput(
              obscureText: true,
              controller: confirmPasswordController,
              maxLength: 50,
              textInputAction: TextInputAction.done,
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
                  return 'Mật khẩu xác nhận không được để trống';
                }
                return null;
              },
              onFieldSubmitted: (value) => _changePassword(context),
              hintText: 'Mật khẩu xác nhận',
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: DefaultButton(
                text: 'Thay đổi mật khẩu',
                onPressed: () => _changePassword(context),
              )),
        ],
      );

  _changePassword(BuildContext context) {
    if (isValid()) {
      showCenterMessage("Mật khẩu bạn thay đổi thành công")
          .then((value) => backPage());
    }
  }
}
