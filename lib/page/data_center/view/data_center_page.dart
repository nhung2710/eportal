import 'dart:developer';

import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/api/model/request/commonnew/home_works_list_request.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 11/1/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DataCenterPage extends BasePage{
  const DataCenterPage({super.key});


  @override
  State<StatefulWidget> createState() => _DataCenterPageState();
}

class _DataCenterPageState extends BasePageState<DataCenterPage>{
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
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: const <Widget>[
        HomeFragment(),
        ProfileFragment(),
        CommentFragment(),
        NotificationFragment(),
        UserFragment()
      ],

    ),
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
          icon: Icon(Icons.home,color: Colors.blueAccent,),
          label: "Trang chủ",
          activeIcon: Icon(Icons.home,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.accessibility,color: Colors.blueAccent,),
          label: "Hồ sơ",
          activeIcon: Icon(Icons.accessibility,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment,color: Colors.blueAccent,),
          label: "Bình luận",
          activeIcon: Icon(Icons.comment,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications,color: Colors.blueAccent,),
          label: "Thông báo",
          activeIcon: Icon(Icons.notifications,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,color: Colors.blueAccent,),
          label: "Tài khoản",
          activeIcon: Icon(Icons.account_circle,color: Colors.red,),
        ),
      ],

    ),
  );

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.ease,
    );
  }
}
class HomeFragment extends StatelessWidget{
  const HomeFragment({super.key});
  @override
  Widget build(BuildContext context)  => SingleChildScrollView(
    child: SizedBox(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: Text("HomeFragment"),
      ),
    ),
  );
}
class ProfileFragment extends StatelessWidget{
  const ProfileFragment({super.key});
  @override
  @override
  Widget build(BuildContext context)  => SingleChildScrollView(
    child: SizedBox(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
      width: MediaQuery.of(context).size.width,
      child: const Text("ProfileFragment"),
    ),
  );
}
class CommentFragment extends StatelessWidget{
  const CommentFragment({super.key});
  @override
  @override
  Widget build(BuildContext context)  => SingleChildScrollView(
    child: SizedBox(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
      width: MediaQuery.of(context).size.width,
      child: const Text("CommentFragment"),
    ),
  );
}
class NotificationFragment extends StatelessWidget{
  const NotificationFragment({super.key});
  @override
  Widget build(BuildContext context)  => SingleChildScrollView(
    child: SizedBox(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
      width: MediaQuery.of(context).size.width,
      child: const Text("NotificationFragment"),
    ),
  );
}
class UserFragment extends StatelessWidget{
  const UserFragment({super.key});
  @override
  Widget build(BuildContext context)  => Column(
    children: [
      Container(
          padding: const EdgeInsets.only(top: 10 , bottom: 10 ,left: 5,right: 10),
          color: Colors.white,
          height: 80,
          child: const Row(
            children: [
              CircleAvatar(
                backgroundImage:NetworkImage('https://via.placeholder.com/100'),
                backgroundColor: Colors.transparent,
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                    child: Text("Trần Hữu Tùng"),
                  )
              )
            ],
          )
      ),
      Expanded(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                                    child: const Text("UserFragment",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                                ),
                                Container(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                                    child: const Text("UserFragment",textAlign: TextAlign.end,style: AppTextStyle.labelTitle)
                                ),
                              ],
                            )
                        ),
                        const Text("Sửa",textAlign: TextAlign.end,style: AppTextStyle.labelAction)
                      ],
                  ),
                ),
                SizedBox(
                    height: 50,
                    child: Container(
                        color: Colors.white,
                        child: const Text("UserFragment")
                    )
                ),
                SizedBox(
                    height: 50,
                    child: Container(
                        color: Colors.white,
                        child: const Text("UserFragment")
                    )
                ),
              ],
            )
        ),
      )
    ],
  );
}