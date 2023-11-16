import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_news_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_news_list_event.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_news_list_request.dart';
import '../../../../model/api/response/common_new/home_news_list_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/news/news_widget.dart';
import '../../empty_example/page/empty_example_page.dart';
import '../../home_news_list/page/home_news_list_page.dart';
import '../../news_hub/widget/home_works_list_preview.dart';
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
  Widget pageUI(BuildContext context) =>
      DefaultTabController(
        key: localKey,
        length: 3,
        child: Column(
          children: [
            const TabBar(
              indicatorColor: AppColor.colorOfIcon,
              labelColor: Colors.blue,
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
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Tuyển dụng";
}
