//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/business/business_job/page/business_job_page.dart';
import 'package:eportal/page/share/more_action/page/more_action_page.dart';
import 'package:eportal/page/widget/bottom_controller_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../base/page_state/base_page_state.dart';
import '../../../share/home/page/home_page.dart';
import '../../business_user_profile/page/business_user_profile_page.dart';

class DefaultPage extends BasePageWidget {
  @override
  State<StatefulWidget> createState() => DefaultPageState();
}

class DefaultPageState extends BasePageState {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

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
  void initDataLoading() {
    // TODO: implement initDataLoading
  }

  @override
  Widget pageUI(BuildContext context) => PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        children: const <Widget>[
          HomePage(),
          BusinessJobPage(),
          BusinessUserProfilePage(),
          MoreActionPage(),
        ],
      );

  @override
  Widget? getBottomNavigationBar(BuildContext context) =>
      BottomControllerNavigationBar(
        onTap: (page) => _pageController.jumpToPage(page),
        items: [
          BottomControllerNavigationBarItem(
              iconData: FontAwesomeIcons.house, label: 'Trang chủ'),
          BottomControllerNavigationBarItem(
              iconData: FontAwesomeIcons.newspaper, label: 'Tin tuyển dụng'),
          BottomControllerNavigationBarItem(
              iconData: FontAwesomeIcons.userGroup, label: 'Hồ sơ ứng viên'),
          BottomControllerNavigationBarItem(
              iconData: FontAwesomeIcons.listUl, label: 'Mở rộng'),
        ],
      );
}
