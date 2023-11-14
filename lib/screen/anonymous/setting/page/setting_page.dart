import 'package:eportal/model/setting_page_model.dart';
import 'package:eportal/screen/anonymous/setting/widget/setting_item.dart';
import 'package:eportal/screen/share/about/page/about_page.dart';
import 'package:eportal/screen/share/contact/page/contract_page.dart';
import 'package:eportal/screen/share/policy/page/policy_page.dart';
import 'package:eportal/screen/share/support/page/support_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../../share/change_password/page/change_password_page.dart';
import '../../../share/change_user_info/page/change_user_info_page.dart';
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
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends BasePageStateActive<SettingPage> {
  var actions = {
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

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: actions.entries
              .map((e) => Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: Text(
                            e.key,
                            style:
                                AppTextStyle.title.copyWith(color: Colors.blue),
                          )),
                      Column(
                        children: e.value
                            .map((e) => SettingItem(
                                onTap: () => nextPage(e.builder),
                                settingPageModel: e))
                            .toList(),
                      )
                    ],
                  ))
              .toList(),
        ),
      );
}
