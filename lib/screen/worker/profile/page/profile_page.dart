import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';

import '../../../../style/app_color.dart';
import '../../../share/empty_example/page/empty_example_page.dart';
import '../widget/profile_tab.dart';
import '../widget/referrer_tab.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfilePage extends BasePage {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageStateActive<ProfilePage> {
  @override
  bool isHasAppBar(BuildContext context) => false;


  @override
  Widget pageUI(BuildContext context) => DefaultTabController(
    key: localKey,
    length: 2,
    child: const Column(
      children: [
        TabBar(
          indicatorColor: AppColor.colorOfIcon,
          unselectedLabelColor: AppColor.colorOfIcon,
          labelColor: AppColor.colorOfIcon,
          indicatorWeight: 1,
          tabs: [
            Tab(
              text: "Hồ sơ",
            ),
            Tab(
              text: "Người tham khảo",
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ProfileTab(),
              ReferrerTab(),
            ],
          ),
        )
      ],
    ),
  );
}
