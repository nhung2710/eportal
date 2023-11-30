import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/event/common_new/dang_ky_event.dart';
import 'package:eportal/model/api/request/common_new/dang_ky_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_ky_data_request.dart';
import 'package:eportal/model/api/response/common_new/dang_ky_response.dart';
import 'package:eportal/model/api/response/common_new/data/dang_ky_data_response.dart';
import 'package:eportal/screen/share/sign_in/page/sign_in_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/dang_ky_bloc.dart';
import '../../../../extension/string_extension.dart';
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
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  int? role = 0;

  DangKyBloc dangKyBloc = DangKyBloc();

  @override
  String getPageTitle(BuildContext context) => "Đăng ký tài khoản";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => dangKyBloc,
        child: BlocListener<DangKyBloc, DataSingleState<DangKyDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<DangKyDataResponse> state) {
            handlerActionDataSingleState<DangKyDataResponse>(state,
                (obj) async {
              await GlobalApplication().preferences?.setString(
                  ApplicationConstant.REGISTER_USER_NAME,
                  obj!.userName.replaceWhenNullOrWhiteSpace());
              await GlobalApplication().preferences?.setString(
                  ApplicationConstant.REGISTER_USER_PASSWORD,
                  passwordController.text);
              nextPageWithoutBack((context) => const SignInPage());
            });
          },
          child: ListView(
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
                value: 0,
                groupValue: role,
                onChanged: (int? value) {
                  setState(() {
                    role = value;
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
                value: 1,
                groupValue: role,
                onChanged: (int? value) {
                  setState(() {
                    role = value;
                  });
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: FieldInput(
                  controller: firstNameController,
                  textInputAction: TextInputAction.next,
                  hintText: "Họ",
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
                      return 'Họ không được để trống';
                    }
                    return null;
                  },
                  icon: Icons.people,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: FieldInput(
                  controller: lastNameController,
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
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
                    if (text.isNullOrWhiteSpace()) {
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
                child: PasswordInput(
                  obscureText: true,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
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
                    if (text.isNullOrWhiteSpace()) {
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
                  child: DefaultButton(
                    text: 'Đăng ký',
                    onPressed: () => _registerAccount(context),
                  )),
            ],
          ),
        ),
      );

  _registerAccount(BuildContext context) {
    if (isValid()) {
      dangKyBloc.add(DangKyEvent(
          request: DangKyRequest(
              obj: DangKyDataRequest(
                  hoDem: firstNameController.text,
                  ten: lastNameController.text,
                  email: emailController.text,
                  soDienThoai: phoneController.text,
                  role: role,
                  passWord: passwordController.text))));
    }
  }
}
