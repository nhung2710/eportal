//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//


import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/hiring/tab/hiring_tab.dart';
import 'package:eportal/screen/share/news_recruitment/widget/news_recruitment.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';

class HiringPage extends BasePageWidget {
  const HiringPage({super.key});

  @override
  State<StatefulWidget> createState() => HiringPageState();
}

class HiringPageState
    extends BasePageState<HiringPage> {

  @override
  void initBloc() {
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
  }
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
    children: [
      ActionButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            //nextPage((context) => const ProfileSearchPage());
          }

      ),
    ],
  );

  @override
  Widget pageUI(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          "Tin tức tuyển dụng",
          style: AppTextStyle.titlePage.copyWith(
              overflow: TextOverflow.visible,
              fontSize: 18,
              color: AppColor.colorOfIconActive),
        ),
      ),
      Expanded(
        child: CustomTabView(
          tabViews: const {
            "Tốt nhất": HiringTab(
              flag: 0,
            ),
            "Mới nhất": HiringTab(
              flag: 1,
            ),
            "Lương cao nhất": HiringTab(
              flag: 2,
            )
          },
          isScrollable: false,
        ),
      ),
    ],
  );

}