import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/anonymous/home/home_page.dart';
import 'package:eportal/screen/share/forgot_password/page/forgot_password_page.dart';
import 'package:eportal/screen/share/sign_up/page/sign_up_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SignInPage extends BasePage{
  const SignInPage({super.key});


  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends BasePageState<SignInPage>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Color currentBackgroundColor(BuildContext context)  => Colors.white;
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context)  {
    nameController.text = GlobalApplication().getStringOneTimePreferences(ApplicationConstant.REGISTER_USER_NAME);
    passwordController.text = GlobalApplication().getStringOneTimePreferences(ApplicationConstant.REGISTER_USER_PASSWORD);
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 20),
              child: Image.asset('assets/images/Logo.jpg',
                alignment: Alignment.center,
                height: 125,
                width: 125,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
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
                  border: OutlineInputBorder(),
                  labelText: 'Tài khoản',
                  counterText: "",

                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                onFieldSubmitted:  (value) => _signIn(context),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mật khẩu',
                  counterText: "",
                ),
              ),
            ),
            TextButton(
              onPressed: () => _forgotPassword(context),
              child: const Text('Quên mật khẩu',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Đăng nhập NLD'),
                  onPressed: () => _signIn(context),
                )
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin:  const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text('Đăng nhập DN'),
                  onPressed: () => _signInBusiness(context),
                )
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin:  const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text('Đăng nhập QL'),
                  onPressed: () => _signInAdmin(context),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Bạn chưa có tài khoản?'),
                TextButton(
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => _signUp(context),
                )
              ],
            ),
          ],
        ));
  }



  _signIn(BuildContext context) {
    if(isValid()){
      loadDataDemo()
          .then((value){
        GlobalApplication().FullName = nameController.text;
        GlobalApplication().UserName = nameController.text;
        GlobalApplication().UserPassword = passwordController.text;
        nextPage((context) => const HomePage());
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
    if(isValid()){
      loadDataDemo()
          .then((value){
        GlobalApplication().FullName = nameController.text;
        GlobalApplication().UserName = nameController.text;
        GlobalApplication().UserPassword = passwordController.text;
        nextPage((context) => const HomePage());
      });

    }
  }

  _signInAdmin(BuildContext context) {

    if(isValid()){
      loadDataDemo()
          .then((value){
        GlobalApplication().FullName = nameController.text;
        GlobalApplication().UserName = nameController.text;
        GlobalApplication().UserPassword = passwordController.text;
        nextPage((context) => const HomePage());
      });

    }
  }
}