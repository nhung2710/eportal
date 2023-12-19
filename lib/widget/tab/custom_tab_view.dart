//
// Created by BlackRose on 19/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  Map<String, Widget> tabViews;

  CustomTabView({super.key, required this.tabViews});

  @override
  State<StatefulWidget> createState() => CustomTabViewState();
}

class CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        vsync: this,
        length: widget.tabViews.length,
        animationDuration: const Duration(seconds: 0));
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void nextPage(int page) {
    _tabController.animateTo(page);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [];
    List<Widget> contents = [];
    for (var item in widget.tabViews.entries) {
      tabs.add(Tab(
        text: item.key,
      ));
      contents.add(item.value);
    }

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: AppColor.colorOfIcon,
          labelColor: AppColor.colorOfIcon,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelStyle:
              AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
          indicatorWeight: 2,
          tabs: tabs,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: contents,
            ),
          ),
        ),
      ],
    );
  }
}
