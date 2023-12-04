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

class _NewsRecruitmentPageState extends BasePageState<NewsRecruitmentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    _tabController = TabController(
        vsync: this, length: 3, animationDuration: const Duration(seconds: 0));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: AppColor.colorOfIcon,
            labelColor: AppColor.colorOfIcon,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            labelStyle:
                AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            indicatorWeight: 2,
            tabs: const [
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
                controller: _tabController,
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
