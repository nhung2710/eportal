//
// Created by BlackRose on 1/8/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/screen/employer/candidate_profile/tab/list_of_candidate_profile_applied_tab.dart';
import 'package:eportal/screen/employer/candidate_profile/tab/list_of_candidate_profile_block_tab.dart';
import 'package:eportal/screen/employer/candidate_profile/tab/list_of_candidate_profile_saved_tab.dart';
import 'package:eportal/screen/employer/candidate_profile/tab/list_of_candidate_profile_viewed_tab.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';

class BusinessUserProfilePage extends BasePageWidget {
  const BusinessUserProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => BusinessUserProfilePageState();
}

class BusinessUserProfilePageState
    extends BasePageState<BusinessUserProfilePage> {
  @override
  void initBloc() {}

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  double getBottomFloatingActionButtonBottom(BuildContext context) => 70;

  @override
  void callApi() {}

  @override
  Widget pageUI(BuildContext context) => Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Danh sách ứng viên",
                style: AppTextStyle.titlePage.copyWith(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    color: AppColor.colorOfIconActive),
              ),
            ),
            Expanded(
              child: CustomTabView(tabViews: const {
                "Hồ sơ ứng viên đã xem": ListOfCandidateProfileViewedTab(),
                "Hồ sơ ứng viên đã lưu": ListOfCandidateProfileSavedTab(),
                "Hồ sơ ứng viên đã ứng tuyển":
                    ListOfCandidateProfileAppliedTab(),
                "Hồ sơ ứng viên đã chặn": ListOfCandidateProfileBlockTab(),
              }),
            ),
          ],
        ),
      );
}
