import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 06/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class CurriculumVitaeAddWorkerPage extends BasePage{
  const CurriculumVitaeAddWorkerPage({super.key});


  @override
  State<StatefulWidget> createState() => _CurriculumVitaeAddWorkerPageState();
}

class _CurriculumVitaeAddWorkerPageState extends BasePageState<CurriculumVitaeAddWorkerPage>{
  TextEditingController emailController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Tạo thông tin CV";
  @override
  Widget? getBottomNavigationBar(BuildContext context) => Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin:  const EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        child: const Text('Tạo'),
        onPressed: () => _submitAsync(context),
      )
  );

  @override
  Color currentBackgroundColor(BuildContext context)  => Colors.white;
  @override
  Widget pageUI(BuildContext context)  => ListView(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(top:10),
        child: TextFormField(
          controller: emailController,
          maxLength: 50,
          textInputAction: TextInputAction.done,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Địa chỉ thư điện tử không được để trống';
            }
            return null;
          },
          onFieldSubmitted:  (value) => _submitAsync(context),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Địa chỉ thư điện tử',
            counterText: "",

          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top:10),
        child: TextFormField(
          controller: emailController,
          maxLength: 50,
          textInputAction: TextInputAction.done,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Địa chỉ thư điện tử không được để trống';
            }
            return null;
          },
          onFieldSubmitted:  (value) => _submitAsync(context),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Địa chỉ thư điện tử',
            counterText: "",

          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top:10),
        child: TextFormField(
          controller: emailController,
          maxLength: 50,
          textInputAction: TextInputAction.done,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Địa chỉ thư điện tử không được để trống';
            }
            return null;
          },
          onFieldSubmitted:  (value) => _submitAsync(context),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Địa chỉ thư điện tử',
            counterText: "",

          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top:10),
        child: TextFormField(
          controller: emailController,
          maxLength: 50,
          textInputAction: TextInputAction.done,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Địa chỉ thư điện tử không được để trống';
            }
            return null;
          },
          onFieldSubmitted:  (value) => _submitAsync(context),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Địa chỉ thư điện tử',
            counterText: "",

          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top:10),
        child: TextFormField(
          controller: emailController,
          maxLength: 50,
          textInputAction: TextInputAction.done,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Địa chỉ thư điện tử không được để trống';
            }
            return null;
          },
          onFieldSubmitted:  (value) => _submitAsync(context),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Địa chỉ thư điện tử',
            counterText: "",

          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top:10),
        child: TextFormField(
          controller: emailController,
          maxLength: 50,
          textInputAction: TextInputAction.done,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Địa chỉ thư điện tử không được để trống';
            }
            return null;
          },
          onFieldSubmitted:  (value) => _submitAsync(context),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Địa chỉ thư điện tử',
            counterText: "",

          ),
        ),
      ),

    ],
  );



  _submitAsync(BuildContext context) {

    if(isValid()){
      loadDataDemo()
      .then((value){
        showCenterMessage("Bạn đã tạo thành công hồ sơ")
            .then((value) => Navigator.pop(context));
      });
    }
  }



}