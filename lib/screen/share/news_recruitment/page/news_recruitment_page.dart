import 'package:flutter/material.dart';

import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/expandable_fab/expandable_fab.dart';
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
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => DefaultTabController(
        key: localKey,
        length: 3,
        child: Column(
          children: [
            const TabBar(
              indicatorColor: AppColor.colorOfIcon,
              labelColor: AppColor.colorOfIcon,
              labelStyle: AppTextStyle.title,
              indicatorWeight: 2,
              tabs: [
                Tab(
                  text: "Tốt nhất",
                ),
                Tab(
                  text: "Mới nhất",
                ),
                Tab(
                  text: "Lương cao",
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    NewsRecruitment(
                      flag: 0,
                    ),
                    NewsRecruitment(
                      flag: 1,
                    ),
                    NewsRecruitment(
                      flag: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Tuyển dụng";
}
