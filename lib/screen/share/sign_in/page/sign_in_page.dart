import 'package:eportal/application/global_application.dart';
import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/enum/role_type.dart';
import 'package:eportal/screen/admin/home/home_page.dart' as admin;
import 'package:eportal/screen/employer/home/home_page.dart' as employer;
import 'package:eportal/screen/share/forgot_password/page/forgot_password_page.dart';
import 'package:eportal/screen/share/sign_up/page/sign_up_page.dart';
import 'package:eportal/screen/worker//home/home_page.dart' as worker;
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/dang_nhap_bloc.dart';
import '../../../../event/common_new/dang_nhap_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/dang_nhap_request.dart';
import '../../../../model/api/request/common_new/data/dang_nhap_data_request.dart';
import '../../../../model/api/response/common_new/dang_nhap_response.dart';
import '../../../../model/api/response/common_new/data/dang_nhap_data_response.dart';
import '../../../../widget/input/field_input.dart';
import '../../../../widget/input/password_input.dart';
import '../../../anonymous/home/home_page.dart' as anonymous;

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SignInPage extends BasePage {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends BasePageState<SignInPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DangNhapBloc dangNhapBloc = DangNhapBloc();

  @override
  double currentPadding(BuildContext context) => 10;

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    nameController.text = GlobalApplication()
        .getStringOneTimePreferences(ApplicationConstant.REGISTER_USER_NAME)
        .replaceWhenNullOrWhiteSpace(GlobalApplication().userNameSaved);
    passwordController.text = GlobalApplication()
        .getStringOneTimePreferences(ApplicationConstant.REGISTER_USER_PASSWORD)
        .replaceWhenNullOrWhiteSpace(GlobalApplication().userPasswordSaved);
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) {
    return BlocProvider(
      create: (_) => dangNhapBloc,
      child: BlocListener<DangNhapBloc, DataSingleState<DangNhapDataResponse>>(
        listener: (context, state) {
          handlerActionDataSingleState<DangNhapDataResponse>(state, (obj) {
            GlobalApplication()
                .signIn(obj, nameController.text, passwordController.text)
                .then((value) {
              switch (GlobalApplication().roleType) {
                case RoleType.users:
                  nextPageWithoutBack((context) => const worker.HomePage());
                  break;
                case RoleType.bussiness:
                  nextPageWithoutBack((context) => const employer.HomePage());
                  break;
                case RoleType.cms:
                  nextPageWithoutBack((context) => const admin.HomePage());
                  break;
                case RoleType.anonymous:
                  // TODO: Handle this case.
                  break;
              }
            });
          });
        },
        child: Center(
          child: ListView(
            shrinkWrap: true,
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
                child: FieldInput(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
                      return 'Tài khoản không được để trống';
                    }
                    return null;
                  },
                  hintText: "Tài khoản",
                  icon: Icons.account_circle,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: PasswordInput(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
                      return 'Mật khẩu không được để trống';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) => _signIn(context),
                  hintText: "Mật khẩu",
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: DefaultButton(
                    text: 'Đăng nhập',
                    onPressed: () => _signIn(context),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.titleAppbarPage.copyWith(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      children: <TextSpan>[
                        const TextSpan(text: 'Bạn chưa có tài khoản? '),
                        TextSpan(
                            text: 'Đăng ký',
                            style: AppTextStyle.titleAppbarPage
                                .copyWith(color: AppColor.colorOfIcon),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _signUp(context)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                    onTap: () => _forgotPassword(context),
                    child: Center(
                        child: Text(
                      'Quên mật khẩu',
                      style: AppTextStyle.titleAppbarPage
                          .copyWith(color: AppColor.colorOfIcon),
                    ))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: GestureDetector(
                    onTap: () => _skipPage(context),
                    child: Center(
                        child: Text(
                      'Trài nghiệm không đăng nhập',
                      style: AppTextStyle.titleAppbarPage
                          .copyWith(color: Colors.grey),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signIn(BuildContext context) {
    if (isValid()) {
      startLoading();
      dangNhapBloc.add(DangNhapEvent(
          request: DangNhapRequest(
              obj: DangNhapDataRequest(
                  userName: nameController.text,
                  passWord: passwordController.text))));
    }
  }

  _forgotPassword(BuildContext context) {
    nextPage((context) => const ForgotPasswordPage());
  }

  _signUp(BuildContext context) {
    nextPage((context) => const SignUpPage());
  }

  _skipPage(BuildContext context) {
    nextPageWithoutBack((context) => const anonymous.HomePage());
  }
}
