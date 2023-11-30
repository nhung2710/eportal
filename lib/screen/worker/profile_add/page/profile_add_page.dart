import 'package:eportal/screen/worker/profile_add/tab/profile_add_basic_tab.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';

import '../../../../widget/base/base_page.dart';
import '../tab/profile_add_career_goals_tab.dart';
import '../tab/profile_add_field_skills_tab.dart';
import '../tab/profile_add_general_tab.dart';
import '../tab/profile_add_level_tab.dart';
import '../tab/profile_add_work_experience_tab.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddPage extends BasePage {
  ProfileAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileAddPageState();
}

class _ProfileAddPageState extends BasePageState<ProfileAddPage> {
  @override
  String getPageTitle(BuildContext context) => "Tạo hồ sơ";

  @override
  Widget pageUI(BuildContext context) => DefaultTabController(
        key: localKey,
        length: 6,
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppColor.colorOfIcon,
              labelColor: AppColor.colorOfIcon,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelStyle:
                  AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
              indicatorWeight: 2,
              tabs: const [
                Tab(
                  text: "Thông tin hồ sơ",
                ),
                Tab(
                  text: "Thông tin chung",
                ),
                Tab(
                  text: "Trình độ học vấn",
                ),
                Tab(
                  text: "Kinh nghiệm làm việc",
                ),
                Tab(
                  text: "Mục tiêu nghề nghiệp",
                ),
                Tab(
                  text: "Kỹ năng sở trường",
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileAddBasicTab(),
                    ProfileAddGeneralTab(),
                    const ProfileAddLevelTab(),
                    const ProfileAddWorkExperienceTab(),
                    ProfileAddCareerGoalsTab(),
                    ProfileAddFieldSkillsTab(),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: CapchaInput(
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) => _send(context),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultButton(
                  text: 'Tạo',
                  onPressed: () => _send(context),
                )),
          ],
        ),
      );

  _send(BuildContext context) {
    if (isValid()) {
      showCenterMessage("Thêm hồ sơ thành công").then((value) => backPage());
    }
  }
}
