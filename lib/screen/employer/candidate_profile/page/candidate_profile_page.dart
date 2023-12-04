import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../../share/empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class CandidateProfilePage extends BasePage {
  const CandidateProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _CandidateProfilePageState();
}

class _CandidateProfilePageState
    extends BasePageStateActive<CandidateProfilePage>
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
  bool isHasAppBar(BuildContext context) => false;

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
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelStyle:
                AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            indicatorWeight: 2,
            tabs: const [
              Tab(
                text: "Danh sách việc làm",
              ),
              Tab(
                text: "Việc làm đã ứng tuyển",
              ),
              Tab(
                text: "Việc làm đã lưu lại",
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
                  EmptyExamplePage(isHasAppBar: false),
                  EmptyExamplePage(isHasAppBar: false),
                  EmptyExamplePage(isHasAppBar: false),
                ],
              ),
            ),
          ),
        ],
      );
}
