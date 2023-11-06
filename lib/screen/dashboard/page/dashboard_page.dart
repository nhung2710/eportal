import 'package:eportal/application/global_application.dart';
import 'package:eportal/screen/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/home/page/home_page.dart';
import 'package:eportal/screen/login/page/login_page.dart';
import 'package:eportal/screen/media/page/media_page.dart';
import 'package:eportal/screen/news/page/news_page.dart';
import 'package:eportal/screen/question_and_answer/page/question_and_answer_page.dart';
import 'package:eportal/screen/setting/page/setting_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/app_bar/default_app_bar.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


class DashboardPage extends BasePage{
  const DashboardPage({super.key});


  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends BasePageState<DashboardPage>{
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
        icon: Icon(Icons.home,color: Colors.blueAccent,),
        label: "Trang chủ",
        activeIcon: Icon(Icons.home,color: Colors.red,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.newspaper,color: Colors.blueAccent,),
        label: "Tin tức",
        activeIcon: Icon(Icons.newspaper,color: Colors.red,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.question_mark,color: Colors.blueAccent,),
        label: "Hỏi đáp",
        activeIcon: Icon(Icons.question_mark,color: Colors.red,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.perm_media,color: Colors.blueAccent,),
        label: "Đa phương tiện",
        activeIcon: Icon(Icons.perm_media,color: Colors.red,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings,color: Colors.blueAccent,),
        label: "Cài đặt",
        activeIcon: Icon(Icons.settings,color: Colors.red,),
      ),
    ],

  );
  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
      distance: 120,
      children: [
        ActionButton(
          icon: const Icon(Icons.question_mark, color: Colors.white,),
          onPressed: () {
            _onTabTapped(2);
          },
        ),
        ActionButton(
          icon: const Icon(Icons.chat, color: Colors.white,),
          onPressed: () {
            loadDataDemo().then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.search, color: Colors.white,),
          onPressed: () {
            print('add');
          },
        ),
      ]);

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => DefaultAppBar.get(context);

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
        HomePage(),
        NewsPage(),
        QuestionAndAnswerPage(),
        MediaPage(),
        SettingPage(),
      ],
    ),
  );

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }
}