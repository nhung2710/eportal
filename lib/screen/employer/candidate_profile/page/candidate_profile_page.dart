import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';

import '../tab/list_of_candidate_profile_applied_tab.dart';
import '../tab/list_of_candidate_profile_block_tab.dart';
import '../tab/list_of_candidate_profile_saved_tab.dart';
import '../tab/list_of_candidate_profile_tab.dart';
import '../tab/list_of_candidate_profile_viewed_tab.dart';

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
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    _tabController.dispose();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    _tabController = TabController(
        vsync: this, length: 4, animationDuration: const Duration(seconds: 0));
  }
  @override
  void initDataLoading() {

  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => CustomTabView(
        tabViews: const {
          "Danh sách hồ sơ ứng viên": ListOfCandidateProfileTab(),
          "Hồ sơ ứng viên đã xem": ListOfCandidateProfileViewedTab(),
          "Hồ sơ ứng viên đã lưu": ListOfCandidateProfileSavedTab(),
          "Hồ sơ ứng viên đã ứng tuyển": ListOfCandidateProfileAppliedTab(),
          "Hồ sơ ứng viên đã chặn": ListOfCandidateProfileBlockTab(),
        },
      );

}
