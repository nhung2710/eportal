import 'package:eportal/screen/admin/management_of_events/page/management_of_events_page.dart';
import 'package:eportal/screen/admin/management_of_news/page/management_of_news_page.dart';
import 'package:eportal/screen/admin/setting/page/setting_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/app_bar/default_app_bar.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../share/home_manage/page/home_manage_page.dart';
import '../management_of_banners/page/management_of_banners_page.dart';

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
  final PageController _pageController = PageController(initialPage: 0, keepPage: true);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
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
            label: "Tin bài",
            activeIcon: Icon(
              Icons.newspaper,
              color: AppColor.colorOfIcon,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
              color: AppColor.colorOfHintText,
            ),
            label: "Sự kiện",
            activeIcon: Icon(
              Icons.event,
              color: AppColor.colorOfIcon,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image,
              color: AppColor.colorOfHintText,
            ),
            label: "Quảng cáo",
            activeIcon: Icon(
              Icons.image,
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
          ManagementOfNewsPage(),
          ManagementOfEventsPage(),
          ManagementOfBannersPage(),
          SettingPage(),
        ],
      );

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
    //_pageController.animateToPage(index, duration: const Duration(milliseconds: 100), curve: Curves.bounceInOut);
  }
}
