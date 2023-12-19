import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';

import '../tab/list_of_candidate_profile_applied_tab.dart';
import '../tab/list_of_candidate_profile_invited_tab.dart';
import '../tab/list_of_candidate_profile_saved_tab.dart';
import '../tab/list_of_candidate_profile_tab.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class CandidateProfilePage extends BasePage {
  const CandidateProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _CandidateProfilePageState();
}

class _CandidateProfilePageState
    extends BasePageStateActive<CandidateProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    _tabController = TabController(
        vsync: this, length: 4, animationDuration: const Duration(seconds: 0));
    super.initDataLoading();
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => CustomTabView(
        tabViews: const {
          "Danh sách hồ sơ ứng viên": ListOfCandidateProfileTab(),
          "Hồ sơ đã ứng tuyển": ListOfCandidateProfileAppliedTab(),
          "Hồ sơ ứng viên đã lưu": ListOfCandidateProfileSavedTab(),
          "Hồ sơ ứng viên đã mời": ListOfCandidateProfileInvitedTab(),
        },
      );
}
