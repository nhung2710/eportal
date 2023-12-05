import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
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
  Widget pageUI(BuildContext context) => Column(
        children: [
          TabBar(
            controller: _tabController,
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
                text: "Danh sách hồ sơ ứng viên",
              ),
              Tab(
                text: "Hồ sơ đã ứng tuyển",
              ),
              Tab(
                text: "Hồ sơ ứng viên đã lưu",
              ),
              Tab(
                text: "Hồ sơ ứng viên đã mời",
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListOfCandidateProfileTab(),
                  ListOfCandidateProfileAppliedTab(),
                  ListOfCandidateProfileSavedTab(),
                  ListOfCandidateProfileInvitedTab(),
                ],
              ),
            ),
          ),
        ],
      );
}
