import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 06/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CurriculumVitaeEditWorkerReferencesPage extends BasePage{
  const CurriculumVitaeEditWorkerReferencesPage({super.key});


  @override
  State<StatefulWidget> createState() => _CurriculumVitaeEditWorkerReferencesPageState();
}

class _CurriculumVitaeEditWorkerReferencesPageState extends BasePageState<CurriculumVitaeEditWorkerReferencesPage>{
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
              padding: const EdgeInsets.all(10),
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
              padding: const EdgeInsets.all(10),
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
              padding: const EdgeInsets.all(10),
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
              padding: const EdgeInsets.all(10),
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
              padding: const EdgeInsets.all(10),
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
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin:  const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text('Sửa'),
                  onPressed: () => _submitAsync(context),
                )
            ),
          ],
        ),
      ));

  _submitAsync(BuildContext context) {

    if(_formKey.currentState!.validate()){
      startLoading();
      Future.delayed(const Duration(seconds: 5))
          .then((value){
        stopLoading();
        showCenterMessage("Bạn đã sửa thành công người tham khảo")
            .then((value) => Navigator.pop(context));
      });
    }
  }



}