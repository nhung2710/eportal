import 'package:eportal/bloc/common_new/video_list_bloc.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/api/response/common_new/video_list_response.dart';
import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/screen/share/media_image_manage/page/media_image_manage_page.dart';
import 'package:eportal/screen/share/media_video_manage/page/media_video_manage_page.dart';
import 'package:eportal/screen/share/video/page/video_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:eportal/widget/news/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../event/common_new/video_list_event.dart';
import '../../../../model/api/request/common_new/data/video_list_data_request.dart';
import '../../../../model/api/request/common_new/video_list_request.dart';
import '../../../../model/api/response/common_new/data/video_list_data_response.dart';

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
}
