import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/share/news_hub/widget/home_news_list_preview.dart';
import 'package:eportal/screen/share/news_hub/widget/home_works_list_preview.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';

import '../../news_search/page/news_search_page.dart';
import '../../work_search/page/work_search_page.dart';
import '../widget/home_business_list_preview.dart';
import '../widget/home_document_list_preview.dart';
import '../widget/home_job_user_list_preview.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsHubPage extends BasePage {
  const NewsHubPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsHubPageState();
}

class _NewsHubPageState extends BasePageStateActive<NewsHubPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(children: [
        ActionButton(
          icon: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
          onPressed: () {
            loadDataDemo()
                .then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
      ]);

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () => nextPage((context) => const NewsSearchPage()),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tìm kiếm tin bài",
                                style: AppTextStyle.titlePage),
                            Text(
                              "Việc làm - quảng cáo - chính trị - văn bản pháp luật",
                              style: AppTextStyle.titleHintPage,
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () => nextPage((context) => const WorkSearchPage()),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tìm kiếm tin tuyển dụng",
                                style: AppTextStyle.titlePage),
                            Text(
                              "Việc làm - quảng cáo - chính trị - văn bản pháp luật",
                              style: AppTextStyle.titleHintPage,
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () => nextPage((context) => const WorkSearchPage()),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tìm kiếm hồ sơ xin việc",
                                style: AppTextStyle.titlePage),
                            Text(
                              "Việc làm - quảng cáo - chính trị - văn bản pháp luật",
                              style: AppTextStyle.titleHintPage,
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: const Text(
                        "Tin bài",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titlePage,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 200.0,
                      ),
                      child: HomeNewsListPreview(
                        flag: 1,
                      ),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: DefaultTabController(
                  key: localKey,
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        child: const Text(
                          "Tin tuyển dụng",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: AppTextStyle.titlePage,
                        ),
                      ),
                      const TabBar(
                        indicatorColor: Colors.blue,
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
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 35.0,
                          maxHeight: 200.0,
                        ),
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            HomeWorksListPreview(flag: 0),
                            HomeWorksListPreview(flag: 1),
                            HomeWorksListPreview(flag: 2),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: const Text(
                        "Doanh nghiệp tuyển dụng",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titlePage,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 200.0,
                      ),
                      child: const HomeBusinessListPreview(),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: const Text(
                        "Hồ sơ ứng tuyển",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titlePage,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 200.0,
                      ),
                      child: const HomeJobUserListPreview(),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: const Text(
                        "Văn bản pháp luật",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titlePage,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 200.0,
                      ),
                      child: const HomeDocumentListPreview(),
                    )
                  ],
                )),
          ],
        ),
      );
}
