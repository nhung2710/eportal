import 'package:eportal/screen/share/media_image_manage/page/media_image_manage_page.dart';
import 'package:eportal/screen/share/media_video_manage/page/media_video_manage_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class MultimediaPage extends BasePage {
  const MultimediaPage({super.key});

  @override
  State<StatefulWidget> createState() => MultimediaPageState();
}

class MultimediaPageState extends BasePageStateActive<MultimediaPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => DefaultTabController(
        key: localKey,
        length: 2,
        child: Column(
          children: [
            const TabBar(
              indicatorColor: AppColor.colorOfIcon,
              labelColor: AppColor.colorOfIcon,
              labelStyle: AppTextStyle.title,
              indicatorWeight: 2,
              tabs: [
                Tab(
                  text: "Video",
                ),
                Tab(
                  text: "Album",
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    MediaVideoManagePage(),
                    MediaImageManagePage(),
                  ],
                ),
              ),
            )
          ],
        ),
      );

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
  void initDataLoading() {
    // TODO: implement initDataLoading
  }
}
