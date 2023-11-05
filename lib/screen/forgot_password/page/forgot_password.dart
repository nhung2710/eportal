import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/constant/application_regex_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/screen/login/page/login_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//
// Created by BlackRose on 04/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


class ForgotPassword extends BasePage{
  const ForgotPassword({super.key});


  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends BasePageState<ForgotPassword>{
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Color currentBackgroundColor()  => Colors.white;
  @override
  Widget pageUI(BuildContext context)  => Padding(
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
                controller: emailController,
                maxLength: 50,
                textInputAction: TextInputAction.done,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Địa chỉ thư điện tử không được để trống';
                  }
                  if (!text.isValid(ApplicationRegexConstant.EMAIL)) {
                    return 'Địa chỉ thư điện tử không hợp lệ';
                  }
                  return null;
                },
                onFieldSubmitted:  (value) => _registerAccountAsync(context),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Địa chỉ thư điện tử',
                  counterText: "",

                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin:  const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text('Quên mật khẩu'),
                  onPressed: () => _registerAccountAsync(context),
                )
            ),
          ],
        ),
      ));


  _registerAccountAsync(BuildContext context) {
    if(_formKey.currentState!.validate()){
      startLoading();
      Future.delayed(const Duration(seconds: 5))
          .then((value){
        stopLoading();
        showCenterMessage("Hệ thống đã gửi mật khẩu mới về email của bạn vui lòng kiểm tra lại")
            .then((value) => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LoginPage())));
      });
    }
  }


}