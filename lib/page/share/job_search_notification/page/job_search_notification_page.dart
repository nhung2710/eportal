//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:flutter/material.dart';

class JobSearchNotificationPage extends BasePageWidget {

  const JobSearchNotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => JobSearchNotificationPageState();
}

class JobSearchNotificationPageState extends BasePageState<JobSearchNotificationPage> {


  @override
  void initDataLoading() {
    callApi();
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
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => Container(
    color: Colors.redAccent,
  );

}