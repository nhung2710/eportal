import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/admin/home/home_page.dart' as admin;
import 'package:eportal/screen/employer/home/home_page.dart' as employer;
import 'package:eportal/screen/share/forgot_password/page/forgot_password_page.dart';
import 'package:eportal/screen/share/sign_up/page/sign_up_page.dart';
import 'package:eportal/screen/worker//home/home_page.dart' as worker;
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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

  @override
  double currentPadding(BuildContext context) => 10;

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) {
    nameController.text = GlobalApplication()
        .getStringOneTimePreferences(ApplicationConstant.REGISTER_USER_NAME);
    passwordController.text = GlobalApplication().getStringOneTimePreferences(
        ApplicationConstant.REGISTER_USER_PASSWORD);
    return ListView(
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
            controller: nameController,
            maxLength: 50,
            textInputAction: TextInputAction.next,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Tài khoản không được để trống';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Tài khoản',
              counterText: "",
            ),
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
            onFieldSubmitted: (value) => _signIn(context),
            decoration: const InputDecoration(
              labelText: 'Mật khẩu',
              counterText: "",
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Đăng nhập NLD')),
              onPressed: () => _signIn(context),
            )),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Đăng nhập DN')),
              onPressed: () => _signInBusiness(context),
            )),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Đăng nhập QL')),
              onPressed: () => _signInAdmin(context),
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
                          .copyWith(color: Colors.blue),
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
                style:
                    AppTextStyle.titleAppbarPage.copyWith(color: Colors.blue),
              ))),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: GestureDetector(
              onTap: () => backPage(),
              child: Center(
                  child: Text(
                'Trài nghiệm không đăng nhập',
                style:
                    AppTextStyle.titleAppbarPage.copyWith(color: Colors.grey),
              ))),
        ),
      ],
    );
  }

  _signIn(BuildContext context) {
    if (isValid()) {
      loadDataDemo().then((value) {
        GlobalApplication().FullName = nameController.text;
        GlobalApplication().UserName = nameController.text;
        GlobalApplication().UserPassword = passwordController.text;
        nextPage((context) => const worker.HomePage());
      });
    }
  }

  _forgotPassword(BuildContext context) {
    nextPage((context) => const ForgotPasswordPage());
  }

  _signUp(BuildContext context) {
    nextPage((context) => const SignUpPage());
  }

  _signInBusiness(BuildContext context) {
    if (isValid()) {
      loadDataDemo().then((value) {
        GlobalApplication().FullName = nameController.text;
        GlobalApplication().UserName = nameController.text;
        GlobalApplication().UserPassword = passwordController.text;
        nextPage((context) => const employer.HomePage());
      });
    }
  }

  _signInAdmin(BuildContext context) {
    if (isValid()) {
      loadDataDemo().then((value) {
        GlobalApplication().FullName = nameController.text;
        GlobalApplication().UserName = nameController.text;
        GlobalApplication().UserPassword = passwordController.text;
        nextPage((context) => const admin.HomePage());
      });
    }
  }

  _skipPage(BuildContext context) {}
}
