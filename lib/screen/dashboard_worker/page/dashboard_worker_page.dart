import 'package:eportal/application/global_application.dart';
import 'package:eportal/screen/candidate/page/candidate_page.dart';
import 'package:eportal/screen/candidate_filter/page/candidate_filter_page.dart';
import 'package:eportal/screen/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/curriculum_vitae_worker/page/curriculum_vitae_worker_page.dart';
import 'package:eportal/screen/employer_profile/page/employer_profile_page.dart';
import 'package:eportal/screen/setting_business/page/setting_business_page.dart';
import 'package:eportal/widget/app_bar/default_app_bar.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DashboardWorkerPage extends BasePage{
  const DashboardWorkerPage({super.key});


  @override
  State<StatefulWidget> createState() => _DashboardWorkerPageState();
}

class _DashboardWorkerPageState extends BasePageState<DashboardWorkerPage>{
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

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
  PreferredSizeWidget? getAppBar(BuildContext context) => DefaultAppBar.get(context);
  @override
  Widget? getBottomNavigationBar(BuildContext context) => BottomNavigationBar(
    currentIndex: _currentIndex,
    onTap: _onTabTapped,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    iconSize: 24,
    fixedColor: Colors.red,
    unselectedItemColor: Colors.blueAccent,
    selectedFontSize: 8,
    unselectedFontSize: 8,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet_rounded,color: Colors.blueAccent,),
        label: "Hồ sơ",
        activeIcon: Icon(Icons.account_balance_wallet_rounded,color: Colors.red,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle,color: Colors.blueAccent,),
        label: "Ứng viên",
        activeIcon: Icon(Icons.account_circle,color: Colors.red,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.manage_search,color: Colors.blueAccent,),
        label: "Tìm kiếm",
        activeIcon: Icon(Icons.manage_search,color: Colors.red,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings,color: Colors.blueAccent,),
        label: "Cài đặt",
        activeIcon: Icon(Icons.settings,color: Colors.red,),
      ),
    ],

  );

  @override
  double currentPadding(BuildContext context) => 0;
  @override
  Widget pageUI(BuildContext context) => Scaffold(
    body: PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: const <Widget>[
        CurriculumVitaeWorkerPage(),
        CandidatePage(),
        CandidateFilterPage(),
        SettingBusinessPage(),
      ],

    ),
  );

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }
}