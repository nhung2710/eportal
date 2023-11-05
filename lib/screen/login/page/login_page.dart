import 'dart:developer';

import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/custom/custom_message_exception.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/screen/dashboard/page/dashboard_page.dart';
import 'package:eportal/screen/dashboard_business/page/dashboard_business_page.dart';
import 'package:eportal/screen/forgot_password/page/forgot_password.dart';
import 'package:eportal/screen/home/page/home_page.dart';
import 'package:eportal/screen/register/page/register_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class LoginPage extends BasePage{
  const LoginPage({super.key});


  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Color currentBackgroundColor()  => Colors.white;

  @override
  Widget pageUI(BuildContext context)  {
    nameController.text = GlobalApplication().getStringOneTimePreferences(ApplicationConstant.REGISTER_USER_NAME);
    passwordController.text = GlobalApplication().getStringOneTimePreferences(ApplicationConstant.REGISTER_USER_PASSWORD);
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
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
                  onFieldSubmitted:  (value) => _signInAsync(context),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mật khẩu',
                    counterText: "",
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _forgotPasswordAsync(context),
                child: const Text('Quên mật khẩu',),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Đăng nhập'),
                    onPressed: () => _signInAsync(context),
                  )
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin:  const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    child: const Text('Đăng nhập quản lý'),
                    onPressed: () => _signInBusinessAsync(context),
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
                    onPressed: () => _registerAccountAsync(context),
                  )
                ],
              ),
            ],
          ),
        ));
  }



  _signInAsync(BuildContext context) {
    if(_formKey.currentState!.validate()){
      startLoading();
      Future.delayed(const Duration(seconds: 5))
      .then((value){
          stopLoading();
          GlobalApplication().FullName = nameController.text;
          GlobalApplication().UserName = nameController.text;
          GlobalApplication().UserPassword = passwordController.text;
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const DashboardPage()));
      });
    }
  }

  _forgotPasswordAsync(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const ForgotPassword()));

  }


  _registerAccountAsync(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const RegisterPage()));
  }



  _signInBusinessAsync(BuildContext context) {
    if(_formKey.currentState!.validate()){
      startLoading();
      Future.delayed(const Duration(seconds: 5))
      .then((value){
        stopLoading();
        GlobalApplication().FullName = nameController.text;
        GlobalApplication().UserName = nameController.text;
        GlobalApplication().UserPassword = passwordController.text;
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const DashboardBusinessPage()));
      });

    }
  }
}