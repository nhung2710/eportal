import 'dart:developer';

import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/api/model/request/commonnew/home_works_list_request.dart';
import 'package:eportal/page/data_center/view/data_center_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/1/2023.
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
  @override
  Widget pageUI(BuildContext context)  => Padding(
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
            child: TextField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tài khoản',

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) => _signInAsync(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mật khẩu',
              ),
            ),
          ),
          TextButton(
            onPressed: () => _forgotPasswordAsync(),
            child: const Text('Quên mật khẩu',),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Đăng nhập'),
                onPressed: () => _signInAsync(),
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
                onPressed: () => _createAccount(),
              )
            ],
          ),
        ],
      ));

  _signInAsync() {
    log('name : ${nameController.text}');
    log('name : ${passwordController.text}');
    startLoading();
    Future.delayed(const Duration(seconds: 5),() => _signResult());
  }

  _forgotPasswordAsync() {
    showBottomError("Tính năng đang phát triển");
  }

  _signResult() {
    stopLoading();
    Navigator.push(context,MaterialPageRoute(builder: (context) => const DataCenterPage()));
  }

  _createAccount() {
    showCenterError("Tính năng đang phát triển");
  }
}