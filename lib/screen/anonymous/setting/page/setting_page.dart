import 'package:eportal/screen/share/about/page/about_page.dart';
import 'package:eportal/screen/share/contact/page/contract_page.dart';
import 'package:eportal/screen/share/policy/page/policy_page.dart';
import 'package:eportal/screen/share/support/page/support_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/list_viewer/custom_list_viewer.dart';
import 'package:flutter/material.dart';

import '../../../../widget/list_viewer/setting_item_viewer.dart';
import '../../../share/chart_economically_active/page/chart_economically_active_page.dart';
import '../../../share/chart_economically_inactive/page/chart_economically_inactive_page.dart';
import '../../../share/chart_unemployment_rate/page/chart_unemployment_rate_page.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class SettingPage extends BasePage {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingPageState();
}

class SettingPageState extends BasePageStateActive<SettingPage> {
  var actions = {
    "Biểu đồ": [
      SettingPageModel(
          icon: Icons.bar_chart_outlined,
          title: "Lao động thất nghiệp",
          builder: (context) => const ChartUnemploymentRatePage()),
      SettingPageModel(
          icon: Icons.bar_chart_outlined,
          title: "Lao động HDKT",
          builder: (context) => const ChartEconomicallyActivePage()),
      SettingPageModel(
          icon: Icons.bar_chart_outlined,
          title: "Lao động không HDKT",
          builder: (context) => const ChartEconomicallyInactivePage())
    ],
    "Hệ thống": [
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
          builder: (context) => const PolicyPage())
    ]
  };

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
                              onTap: () => nextPage(e.builder),
                              settingPageModel: e)))
                      .toList()))
              .toList(),
        ),
      );
}
