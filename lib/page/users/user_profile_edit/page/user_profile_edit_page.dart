//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/users/user_profile_add/page/user_profile_add_page.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_basic_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_career_goals_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_field_skills_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_general_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_level_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_work_experience_tab.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';

class UserProfileEditPage extends BasePageWidget {
  final JobUserListByUserNameDataResponse data;
  const UserProfileEditPage({super.key,required this.data});

  @override
  State<StatefulWidget> createState() => UserProfileEditPageState();
}

class UserProfileEditPageState
    extends BasePageState<UserProfileEditPage> {

  final GlobalKey<UserProfileBasicTabState> keyUserProfileBasicTabState =GlobalKey<UserProfileBasicTabState>();
  final GlobalKey<UserProfileGeneralTabState> keyUserProfileGeneralTabState =GlobalKey<UserProfileGeneralTabState>();
  final GlobalKey<UserProfileLevelTabState> keyUserProfileLevelTabState =GlobalKey<UserProfileLevelTabState>();
  final GlobalKey<UserProfileWorkExperienceTabState> keyUserProfileWorkExperienceTabState =GlobalKey<UserProfileWorkExperienceTabState>();
  final GlobalKey<UserProfileCareerGoalsTabState> keyUserProfileCareerGoalsTabState =GlobalKey<UserProfileCareerGoalsTabState>();
  final GlobalKey<UserProfileFieldSkillsTabState> keyUserProfileFieldSkillsTabState =GlobalKey<UserProfileFieldSkillsTabState>();
  @override
  void initBloc() {
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }


  @override
  void getMoreData() {
    callApi();
  }

  @override
  void initDataLoading() {
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  void callApi() {
  }


  @override
  Widget pageUI(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Sửa hồ sơ",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
      ),
      Expanded(
        child: CustomTabView(tabViews: {
          "Thông tin hồ sơ": UserProfileBasicTab(
            key: keyUserProfileBasicTabState,
            data: widget.data,
          ),
          "Thông tin chung": UserProfileGeneralTab(
            key: keyUserProfileGeneralTabState,
            data: widget.data,
          ),
          "Trình độ học vấn": UserProfileLevelTab(
            key: keyUserProfileLevelTabState,
            data: widget.data,
          ),
          "Kinh nghiệm làm việc": UserProfileWorkExperienceTab(
            key: keyUserProfileWorkExperienceTabState,
            data: widget.data,
          ),
          "Mục tiêu nghề nghiệp": UserProfileCareerGoalsTab(
            key: keyUserProfileCareerGoalsTabState,
            data: widget.data,
          ),
          "Kỹ năng sở trường": UserProfileFieldSkillsTab(
            key: keyUserProfileFieldSkillsTabState,
            data: widget.data,
          ),
        }),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        child: DefaultCapchaTextFormField(
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (value) => submitForm(),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: const EdgeInsets.all(10),
            child: DefaultButton(
              text: 'Sửa',
              onPressed: () => submitForm(),
            )),
      ),
    ],
  );

  void submitForm() {

    if (isValid()) {
      callApi();
    }
  }
}