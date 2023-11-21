import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/share/sign_in/page/sign_in_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../../../style/app_color.dart';
import '../../../../widget/input/capcha_input.dart';
import '../../../../widget/input/field_input.dart';
import '../../../../widget/input/password_input.dart';

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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool? isWorker = false;

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
          RadioListTile(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            title: const Text(
              'Người lao động tìm việc làm',
            ),
            contentPadding: EdgeInsets.zero,
            activeColor: AppColor.colorOfIcon,
            value: true,
            groupValue: isWorker,
            onChanged: (bool? value) {
              setState(() {
                isWorker = value;
              });
            },
          ),
          RadioListTile(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            title: const Text('Doanh nghiệp tuyển dụng'),
            contentPadding: EdgeInsets.zero,
            activeColor: AppColor.colorOfIcon,
            value: false,
            groupValue: isWorker,
            onChanged: (bool? value) {
              setState(() {
                isWorker = value;
              });
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: firstNameController,
              textInputAction: TextInputAction.next,
              hintText: "Họ",
              icon: Icons.people,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: lastNameController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Tên không được để trống';
                }
                return null;
              },
              hintText: "Tên",
              icon: Icons.person,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: emailController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ thư điện tử không được để trống';
                }
                return null;
              },
              hintText: "Địa chỉ thư điện tử",
              icon: Icons.email,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: phoneController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
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
              controller: nameController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Tài khoản không được để trống';
                }
                return null;
              },
              icon: Icons.account_circle,
              hintText: "Tài khoản",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: PasswordInput(
              obscureText: true,
              controller: passwordController,
              textInputAction: TextInputAction.done,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Mật khẩu không được để trống';
                }
                return null;
              },
              onFieldSubmitted: (value) => _registerAccount(context),
              hintText: "Mật khẩu",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: PasswordInput(
              obscureText: true,
              controller: confirmController,
              textInputAction: TextInputAction.done,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Mật khẩu xác nhận không được để trống';
                }
                if (text != passwordController.text) {
                  return 'Mật khẩu xác nhận không khớp';
                }
                return null;
              },
              onFieldSubmitted: (value) => _registerAccount(context),
              hintText: "Mật khẩu xác nhận",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CapchaInput(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => _registerAccount(context),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.colorOfIcon),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Đăng ký'),
                ),
                onPressed: () => _registerAccount(context),
              )),
        ],
      );

  /*
  @override
  Widget pageUI(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Logo.jpg',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            height: 125,
            width: 125,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.colorOfIcon),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Bạn là người lao động tìm việc làm?'),
              ),
              onPressed: () =>
                  nextPage((context) => const SignUpWorkerPage()),
            )),
        Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.colorOfIcon),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Bạn là doanh nghiệp cần tuyển dụng?'),
              ),
              onPressed: () =>
                  nextPage((context) => const SignUpEmployerPage()),
            )),
        Container(
          width: double.infinity,
          color: Colors.transparent,
          height: 125,
        ),
      ],
    ),
  );*/
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
