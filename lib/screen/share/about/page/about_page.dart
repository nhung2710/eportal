import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AboutPage extends BasePage{
  const AboutPage({super.key});


  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends BasePageState<AboutPage>{

  @override
  String getPageTitle(BuildContext context)  => "Giới thiệu";
  late Future<String> _content;


  @override
  void initDataLoading() {
    _content = getContent();
  }
  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
    child: FutureBuilder<String>(
      future: _content,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot)
      {
        return snapshot.hasData ? Text(snapshot.data!) : const CircularProgressIndicator();

      }
    ),
  );

  Future<String> getContent() async {
    try {
      return await rootBundle.loadString('assets/texts/about.txt');
    }
    catch (e) {
      // If encountering an error, return 0.
      print(e);
    }
    return "";
  }

}