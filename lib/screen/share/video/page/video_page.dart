import 'package:eportal/model/api/response/common_new/data/video_list_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/video/eportal_video_widget.dart';

//
// Created by BlackRose on 22/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class VideoPage extends BasePage {
  VideoListDataResponse data;

  VideoPage({required this.data});

  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends BasePageState<VideoPage> {
  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    super.initDataLoading();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.data.name.supportHtml(),
              textAlign: TextAlign.center,
              style: AppTextStyle.titlePage.copyWith(
                  overflow: TextOverflow.visible, color: AppColor.colorOfIcon),
            ),
            EportalVideoWidget(
              videoPath: widget.data.isYoutube == true
                  ? null
                  : widget.data.mediaUrl.getImageUrl(),
              youtubeId:
                  widget.data.isYoutube == true ? widget.data.mediaUrl : null,
            ),
          ],
        ),
      );
}
