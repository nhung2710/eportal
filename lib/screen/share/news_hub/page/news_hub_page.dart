import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data.dart' as requestData;
import 'package:eportal/model/api/request/common_new/home_works_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_works_list_response.dart';
import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/share/news_hub/widget/home_news_list_preview.dart';
import 'package:eportal/screen/share/news_hub/widget/home_work_list_preview.dart';
import 'package:eportal/screen/share/news_hub/widget/news_slide_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsHubPage extends BasePage{
  const NewsHubPage({super.key});


  @override
  State<StatefulWidget> createState() => _NewsHubPageState();
}

class _NewsHubPageState extends BasePageStateActive<NewsHubPage>{
  @override
  bool isHasAppBar(BuildContext context) => false;
  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
      children: [
        ActionButton(
          icon: const Icon(Icons.newspaper, color: Colors.white),
          onPressed: () {
            loadDataDemo().then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.search, color: Colors.white,),
          onPressed: () {
            loadDataDemo().then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.work, color: Colors.white,),
          onPressed: () {
            loadDataDemo().then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.chat, color: Colors.white,),
          onPressed: () {
            loadDataDemo().then((value) => nextPage((context) => const ChatBotPage()));
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
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bạn muốn tìm kiếm tin tức",style: AppTextStyle.titlePage),
                          Text("Việc làm - quảng cáo - chính trị - văn bản pháp luật",style: AppTextStyle.titleHintPage,),
                        ],
                      ),
                    )
                ),
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.search,color: Colors.blue,),
                ),
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
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
                  child: const Text("Tin tức",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
                ),
                SizedBox(
                  height: 200,
                  child: HomeNewsListPreview(flag: 1,),
                )
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
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
                    child: const Text("Tin tuyển dụng",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
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
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        HomeWorkListPreview(flag: 0),
                        HomeWorkListPreview(flag: 1),
                        HomeWorkListPreview(flag: 2),
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
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
                  child: const Text("Doanh nghiệp tuyển dụng",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
                ),
                SizedBox(
                  height: 200,
                  child: HomeNewsListPreview(flag: 1,),
                )
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
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
                  child: const Text("Hồ sơ ứng tuyển",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
                ),
                SizedBox(
                  height: 200,
                  child: HomeNewsListPreview(flag: 1,),
                )
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
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
                  child: const Text("Văn bản pháp luật",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
                ),
                SizedBox(
                  height: 200,
                  child: HomeNewsListPreview(flag: 1,),
                )
              ],
            )
        ),

      ],
    ),
  );

}
