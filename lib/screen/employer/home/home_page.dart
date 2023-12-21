import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/app_bar/default_app_bar.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../share/home_manage/page/home_manage_page.dart';
import '../candidate_profile/page/candidate_profile_page.dart';
import '../job_advertisement/page/job_advertisement_page.dart';
import '../setting/page/setting_page.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageStateActive<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;


  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    _pageController.dispose();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    _pageController =
      PageController(initialPage: _currentIndex, keepPage: true);
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget? getBottomNavigationBar(BuildContext context) => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        fixedColor: AppColor.colorOfIcon,
        unselectedItemColor: AppColor.colorOfHintText,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColor.colorOfHintText,
            ),
            label: "Trang chủ",
            activeIcon: Icon(
              Icons.home,
              color: AppColor.colorOfIcon,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
              color: AppColor.colorOfHintText,
            ),
            label: "Tin tuyển dụng",
            activeIcon: Icon(
              Icons.newspaper,
              color: AppColor.colorOfIcon,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.groups,
              color: AppColor.colorOfHintText,
            ),
            label: "Hồ sơ ứng viên",
            activeIcon: Icon(
              Icons.groups,
              color: AppColor.colorOfIcon,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              color: AppColor.colorOfHintText,
            ),
            label: "Mở rộng",
            activeIcon: Icon(
              Icons.more_horiz,
              color: AppColor.colorOfIcon,
            ),
          ),
        ],
      );

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) =>
      DefaultAppBar.get(context);

  @override
  Widget pageUI(BuildContext context) => PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const <Widget>[
          HomeManagePage(),
          JobAdvertisementPage(),
          CandidateProfilePage(),
          SettingPage(),
        ],
      );

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
    //_pageController.animateToPage(index, duration: const Duration(milliseconds: 100), curve: Curves.bounceInOut);
  }
}
