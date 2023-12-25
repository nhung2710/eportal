import 'package:eportal/application/global_application.dart';
import 'package:eportal/screen/share/about/page/about_page.dart';
import 'package:eportal/screen/share/change_password/page/change_password_page.dart';
import 'package:eportal/screen/share/change_user_info/page/change_user_info_page.dart';
import 'package:eportal/screen/share/contact/page/contract_page.dart';
import 'package:eportal/screen/share/map/page/map_page.dart';
import 'package:eportal/screen/share/policy/page/policy_page.dart';
import 'package:eportal/screen/share/support/page/support_page.dart';
import 'package:eportal/screen/share/terms_of_use/page/terms_of_use_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/list_viewer/custom_list_viewer.dart';
import 'package:eportal/widget/list_viewer/setting_item_viewer.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class SettingPage extends BasePage {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends BasePageState<SettingPage> {
  final actions = {
    "Thông tin": [
      SettingPageModel(
          icon: Icons.change_circle_outlined,
          title: "Đổi thông tin",
          builder: (context) => const ChangeUserInfoPage()),
      SettingPageModel(
          icon: Icons.password_sharp,
          title: "Đổi mật khẩu",
          builder: (context) => const ChangePasswordPage()),
    ],
    "Hệ thống": [
      SettingPageModel(
          icon: Icons.map,
          title: "Bản đồ",
          builder: (context) => const MapPage()),
      SettingPageModel(
          icon: Icons.account_tree,
          title: "Giới thiệu",
          builder: (context) => const AboutPage()),
      SettingPageModel(
          icon: Icons.support_agent,
          title: "Hỗ trợ",
          builder: (context) => const SupportPage()),
      SettingPageModel(
          icon: Icons.contact_support,
          title: "Liên hệ",
          builder: (context) => const ContractPage()),
      SettingPageModel(
          icon: Icons.policy,
          title: "Chính sách",
          builder: (context) => const PolicyPage()),
      SettingPageModel(
          icon: Icons.rule,
          title: "Quy định",
          builder: (context) => const TermsOfUsePage()),
      SettingPageModel(
          icon: Icons.share,
          title: "Chia sẻ",
          onTap: () => GlobalApplication().shareApp(),
          builder: (context) => const PolicyPage())
    ]
  };

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: CustomListViewer(
          children: actions.entries
              .map((e) => CustomItemViewer(
                  title: e.key,
                  children: e.value
                      .map((e) => CustomItemViewer(
                          currrent: SettingItemViewer(
                              onTap: e.onTap ?? () => nextPage(e.builder),
                              settingPageModel: e)))
                      .toList()))
              .toList(),
        ),
      );
}
