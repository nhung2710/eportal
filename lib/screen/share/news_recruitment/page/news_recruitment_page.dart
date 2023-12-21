import 'package:flutter/material.dart';

import '../../../../widget/base/base_page.dart';
import '../../../../widget/expandable_fab/expandable_fab.dart';
import '../../../../widget/tab/custom_tab_view.dart';
import '../../work_search/page/work_search_page.dart';
import '../widget/news_recruitment.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsRecruitmentPage extends BasePage {
  int flag;

  NewsRecruitmentPage({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => _NewsRecruitmentPageState();
}

class _NewsRecruitmentPageState extends BasePageState<NewsRecruitmentPage> {
  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }

  @override
  void callApi() {
    // TODO: implement callApi
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
  void initBloc() {
    // TODO: implement initBloc
  }

  @override
  Widget pageUI(BuildContext context) => CustomTabView(
        tabViews: {
          "Tốt nhất": NewsRecruitment(
            flag: 0,
          ),
          "Mới nhất": NewsRecruitment(
            flag: 1,
          ),
          "Lương cao nhất": NewsRecruitment(
            flag: 2,
          )
        },
        isScrollable: false,
      );

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
        children: [
          ActionButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => nextPage((context) => const WorkSearchPage()),
          ),
        ],
      );

  @override
  String getPageTitle(BuildContext context) => "Tuyển dụng";
}
