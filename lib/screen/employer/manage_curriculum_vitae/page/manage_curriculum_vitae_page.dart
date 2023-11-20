import 'package:eportal/screen/worker/profile/widget/profile_tab.dart';
import 'package:eportal/screen/worker/profile/widget/referrer_tab.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ManageCurriculumVitaePage extends BasePage {
  const ManageCurriculumVitaePage({super.key});

  @override
  State<StatefulWidget> createState() => _ManageCurriculumVitaePageState();
}

class _ManageCurriculumVitaePageState
    extends BasePageStateActive<ManageCurriculumVitaePage> {
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
