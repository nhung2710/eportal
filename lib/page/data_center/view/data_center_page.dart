import 'dart:developer';

import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/api/model/request/commonnew/home_works_list_request.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget pageUI(BuildContext context) => Scaffold(
    body: const Padding(padding: EdgeInsets.all(10)),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.red,
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
          label: "CV & Profile",
          activeIcon: Icon(Icons.accessibility,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment,color: Colors.blueAccent,),
          label: "Comment",
          activeIcon: Icon(Icons.comment,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications,color: Colors.blueAccent,),
          label: "Comment",
          activeIcon: Icon(Icons.notifications,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,color: Colors.blueAccent,),
          label: "Comment",
          activeIcon: Icon(Icons.account_circle,color: Colors.red,),
        ),
      ],

    ),
  );
}