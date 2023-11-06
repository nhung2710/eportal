import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 07/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


class ReportChartDashboardPage extends BasePage{
  const ReportChartDashboardPage({super.key});


  @override
  State<StatefulWidget> createState() => _ReportChartDashboardPageState();
}

class _ReportChartDashboardPageState extends BasePageState<ReportChartDashboardPage>{
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