//
// Created by BlackRose on 1/8/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/users/user_work/tab/user_work_list_tab.dart';
import 'package:eportal/page/users/user_work/tab/user_work_list_viewed_tab.dart';
import 'package:eportal/screen/worker/job/tab/list_of_job_applied_page.dart';
import 'package:eportal/screen/worker/job/tab/list_of_job_saved_page.dart';
import 'package:eportal/screen/worker/job/tab/list_of_job_viewed_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';

import '../../../../widget/base/base_page.dart';
import '../../../base/page_state/base_page_keep_state.dart';
import '../tab/user_work_list_applied_tab.dart';
import '../tab/user_work_list_saved_tab.dart';

class UserWorkPage extends BasePageWidget {
  const UserWorkPage({super.key});

  @override
  State<StatefulWidget> createState() => UserWorkPageState();
}

class UserWorkPageState extends BasePageKeepState<UserWorkPage> {
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
  Widget pageUI(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Danh sách việc làm",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
      ),
      Expanded(
        child: CustomTabView(tabViews: const {
          "Việc làm": UserWorkListTab(),
          "Việc làm đã xem": UserWorkListViewedTab(),
          "Việc làm đã ứng tuyển dụng": UserWorkListAppliedTab(),
          "Việc làm đã lưu lại": UserWorkListSavedTab(),
        }),
      ),
    ],
  );
}
