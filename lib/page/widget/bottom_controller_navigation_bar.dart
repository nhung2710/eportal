//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_color.dart';
import 'package:flutter/material.dart';
class BottomControllerNavigationBarItem{
  IconData iconData;
  String label;
  BottomControllerNavigationBarItem({required this.iconData,required this.label});
}
class BottomControllerNavigationBar extends StatefulWidget{
  final ValueChanged<int>? onTap;
  final List<BottomControllerNavigationBarItem> items;
  const BottomControllerNavigationBar({super.key,this.onTap,this.items = const []});

  @override
  State<StatefulWidget> createState()  => BottomControllerNavigationBarState();
}

class BottomControllerNavigationBarState extends State<BottomControllerNavigationBar>{
  int _currentIndex = 0;
  List<BottomNavigationBarItem> items = [];
  @override
  void initState() {
    // TODO: implement initState
    items = widget.items.map((e) => BottomNavigationBarItem(
      icon: Icon(
        e.iconData,
        color: Colors.white,
      ),
      label: e.label,
      activeIcon: Icon(
        e.iconData,
        color: AppColor.colorOfIconActive,
      ),
    )).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        useLegacyColorScheme: false,
        enableFeedback: false,
        currentIndex: _currentIndex,
        onTap: (page) {
          if(widget.onTap!=null) {
            widget.onTap!(page);
          }
          _currentIndex = page;
          setState(() {});
        },
        backgroundColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        fixedColor: AppColor.colorOfIconActive,
        unselectedItemColor: Colors.white,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        items: items,
      ),
    );
  }
}

