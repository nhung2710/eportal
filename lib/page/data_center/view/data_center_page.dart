import 'dart:developer';

import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/api/model/request/commonnew/home_works_list_request.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(top: 10 , bottom: 10 ,left: 5,right: 30),
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
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
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
                                  child: const Text("Thông tin",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Chưa cập nhật",textAlign: TextAlign.end,style: AppTextStyle.labelTitle)
                              ),
                            ],
                          )
                      ),
                      const Text("Sửa",textAlign: TextAlign.end,style: AppTextStyle.labelAction)
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
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
                                  child: const Text("Thông tin",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Chưa cập nhật",textAlign: TextAlign.end,style: AppTextStyle.labelTitle)
                              ),
                            ],
                          )
                      ),
                      const Text("Sửa",textAlign: TextAlign.end,style: AppTextStyle.labelAction)
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
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
                                  child: const Text("Thông tin",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Chưa cập nhật",textAlign: TextAlign.end,style: AppTextStyle.labelTitle)
                              ),
                            ],
                          )
                      ),
                      const Text("Sửa",textAlign: TextAlign.end,style: AppTextStyle.labelAction)
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: const Text("Quản lý hồ sơ",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.insert_chart,size: 30,color: Colors.green,),
                      const Expanded(
                          flex: 1,
                          child:
                          Padding(
                            padding: EdgeInsets.only( left: 10,right: 10),
                            child: Text("Thông tin tìm việc",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold),
                          )
                      ),
                      Switch(
                          value: true, onChanged: (v)=> {}
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.insert_chart,size: 30,color: Colors.green,),
                      const Expanded(
                          flex: 1,
                          child:
                          Padding(
                            padding: EdgeInsets.only( left: 10,right: 10),
                            child: Text("Cho phép NTD liên hệ",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold),
                          )
                      ),
                      Switch(
                          value: false,
                          onChanged: (v)=> {},
                          activeColor: Colors.red,


                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                  child: Image.network('https://down-vn.img.susercontent.com/file/vn-50009109-df0b36a3c21c48b987c7d7eb12dd129d',
                    height: 80,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: const Text("Quản lý tìm việc",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 2.2,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: List.generate(5, (index) =>Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black12,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: const Icon(Icons.shopping_bag,color: Colors.green,)
                                  ),
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text("Việc làm đang ứng tuyển",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text("0",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold),
                                        )
                                      ],
                                    )
                                )
                              ],
                            )
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                  child: Image.network('https://down-vn.img.susercontent.com/file/vn-50009109-df0b36a3c21c48b987c7d7eb12dd129d',
                    height: 80,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 10,
                  thickness: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: const Text("Cài đặt tài khoản",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: List.generate(5, (index) =>Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(
                              color: Colors.black12,
                              width: 0.5
                          )),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.lock),
                            Expanded(
                              flex: 1,
                              child: Container(

                                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                                  child: const Text("Tính năng mới",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold)
                              ),
                            ),
                            const FaIcon(FontAwesomeIcons.angleRight)
                          ],
                        )
                    )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: const Text("Chính sách và hỗ trợ",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: List.generate(5, (index) =>Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(
                              color: Colors.black12,
                              width: 0.5
                          )),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.lock),
                            Expanded(
                              flex: 1,
                              child: Container(

                                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                                  child: const Text("Tính năng mới",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold)
                              ),
                            ),
                            const FaIcon(FontAwesomeIcons.angleRight)
                          ],
                        )
                    )),
                  ),
                ),
              ],
            )
        ),
      )
    ],
  );
}
