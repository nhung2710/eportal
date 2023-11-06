import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/setting_page_model.dart';
import 'package:eportal/screen/dashboard/page/dashboard_page.dart';
import 'package:eportal/screen/login/page/login_page.dart';
import 'package:eportal/screen/setting/page/setting_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SettingBusinessPage extends BasePage{
  const SettingBusinessPage({super.key});


  @override
  State<StatefulWidget> createState() => _SettingBusinessPageState();
}

class _SettingBusinessPageState extends BasePageState<SettingBusinessPage>{
  List<SettingPageModel> Settings = [
    SettingPageModel(icon: Icons.help,title: "Giới thiệu",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.help,title: "Giới thiệu",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.help,title: "Giới thiệu",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.help,title: "Giới thiệu",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.help,title: "Giới thiệu",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.help,title: "Giới thiệu",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.help,title: "Giới thiệu",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.area_chart,title: "Biểu đồ",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.help,title: "Giới thiệu",builder: (context) => SettingPage()),
    SettingPageModel(icon: Icons.policy,title: "Chính sách",builder: (context) => SettingPage())
  ];
  @override
  bool isHasAppBar(BuildContext context) => false;
  @override
  Widget pageUI(BuildContext context) =>SingleChildScrollView(
    child: Column(
      children: Settings.map((e) =>
          GestureDetector(
            onTap: () => nextPage(e.builder),
            child: Container(
                margin:  const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(e.icon,color: Colors.blue,),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.only(right: 10,left: 10),
                          child: Text(e.title,textAlign: TextAlign.start,style: AppTextStyle.labelTitle.copyWith(color:Colors.blue))
                      ),
                    ),
                    const FaIcon(FontAwesomeIcons.angleRight,size: 20)
                  ],
                )
            ),
          )
      ).toList(),
    ),
  );

}