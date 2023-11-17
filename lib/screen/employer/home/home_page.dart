import 'package:eportal/screen/employer/setting/page/setting_page.dart';
import 'package:eportal/screen/share/answer_and_question/page/answer_and_question_page.dart';
import 'package:eportal/screen/share/multimedia/page/multimedia_page.dart';
import 'package:eportal/screen/share/news_hub/page/news_hub_page.dart';
import 'package:eportal/widget/app_bar/default_app_bar.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../share/home_manage/page/home_manage_page.dart';

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
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

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
        fixedColor: Colors.red,
        unselectedItemColor: Colors.blueAccent,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blueAccent,
            ),
            label: "Trang chủ",
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_mark,
              color: Colors.blueAccent,
            ),
            label: "Hỏi đáp",
            activeIcon: Icon(
              Icons.question_mark,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_media,
              color: Colors.blueAccent,
            ),
            label: "Đa phương tiện",
            activeIcon: Icon(
              Icons.perm_media,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.blueAccent,
            ),
            label: "Cài đặt",
            activeIcon: Icon(
              Icons.settings,
              color: Colors.red,
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
          AnswerAndQuestionPage(),
          MultimediaPage(),
          SettingPage(),
        ],
      );

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
    //_pageController.animateToPage(index, duration: const Duration(milliseconds: 100), curve: Curves.bounceInOut);
  }
}
