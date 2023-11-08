import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/share/news_hub/widget/news_slide_item.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

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
                  child: Icon(Icons.search,color: Colors.green,),
                ),
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
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
                          Text("Bạn muốn tìm việc",style: AppTextStyle.titlePage),
                          Text("Địa điểm - Công ty Vị tri ngành",style: AppTextStyle.titleHintPage,),
                        ],
                      ),
                    )
                ),
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.search,color: Colors.green,),
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
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("Tin tức",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 2,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              scrollDirection: Axis.horizontal,
            ),
            items: ApplicationConstant.URL_NEW.map((item) => Builder(builder: (BuildContext context) => NewsSlideItem(imageUrl: item),)).toList(),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("Việc làm",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 2,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              scrollDirection: Axis.horizontal,
            ),
            items: ApplicationConstant.URL_NEW.map((item) => Builder(builder: (BuildContext context) => NewsSlideItem(imageUrl: item),)).toList(),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("Hồ sơ xin việc",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 2,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              scrollDirection: Axis.horizontal,
            ),
            items: ApplicationConstant.URL_NEW.map((item) => Builder(builder: (BuildContext context) => NewsSlideItem(imageUrl: item),)).toList(),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("Văn bản pháp luật",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 2,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              scrollDirection: Axis.horizontal,
            ),
            items: ApplicationConstant.URL_NEW.map((item) => Builder(builder: (BuildContext context) => NewsSlideItem(imageUrl: item),)).toList(),
          ),
        ),
      ],
    ),
  );

}
