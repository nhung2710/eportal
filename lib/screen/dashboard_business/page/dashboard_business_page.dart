import 'package:eportal/screen/candidate/page/candidate_page.dart';
import 'package:eportal/screen/candidate_filter/page/candidate_filter_page.dart';
import 'package:eportal/screen/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/employer_profile/page/employer_profile_page.dart';
import 'package:eportal/screen/home/page/home_page.dart';
import 'package:eportal/screen/media/page/media_page.dart';
import 'package:eportal/screen/news/page/news_page.dart';
import 'package:eportal/screen/question_and_answer/page/question_and_answer_page.dart';
import 'package:eportal/screen/setting/page/setting_page.dart';
import 'package:eportal/screen/setting_business/page/setting_business_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


class DashboardBusinessPage extends BasePage{
  const DashboardBusinessPage({super.key});


  @override
  State<StatefulWidget> createState() => _DashboardBusinessPageState();
}

class _DashboardBusinessPageState extends BasePageState<DashboardBusinessPage>{
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
        EmployerProfilePage(),
        CandidatePage(),
        CandidateFilterPage(),
        SettingBusinessPage(),
      ],

    ),
    /*floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    floatingActionButton: FloatingActionButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      hoverColor: Colors.blue,
      focusColor: Colors.red,
      foregroundColor: Colors.black,
      backgroundColor: Colors.green,
      onPressed: () {
        showBottomError("Tính năng đang phát triển");
      },
      child: const Icon(Icons.add,color: Colors.white),
    ),*/
    /*floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    floatingActionButton: ExpandableFab(
        distance: 120,
        children: [
          ActionButton(
            icon: const Icon(Icons.chat, color: Colors.white,),
            onPressed: () {

              startLoading();
              Future.delayed(const Duration(seconds: 5))
                  .then((value){
                stopLoading();
                Navigator.push(context,MaterialPageRoute(builder: (context) => const ChatBotPage()));
              });
            },
          ),
        ]),*/
    bottomNavigationBar: BottomNavigationBar(
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

    ),
  );

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }
}