import 'package:eportal/screen/worker/job/tab/list_of_job_page.dart';
import 'package:eportal/screen/worker/job/tab/list_of_job_viewed_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../../../widget/tab/custom_tab_view.dart';
import '../tab/list_of_job_applied_page.dart';
import '../tab/list_of_job_saved_page.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobPage extends BasePage {
  const JobPage({super.key});

  @override
  State<StatefulWidget> createState() => _JobPageState();
}

class _JobPageState extends BasePageStateActive<JobPage> {
  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => CustomTabView(tabViews: const {
        "Danh sách việc làm tuyển dụng": ListOfJobPage(),
        "Việc làm đã xem": ListOfJobViewedPage(),
        "Việc làm đã ứng tuyểndụng": ListOfJobAppliedPage(),
        "Việc làm đã lưu lại": ListOfJobSavedPage(),
      });
}
