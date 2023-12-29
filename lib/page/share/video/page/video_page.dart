//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/video_list_bloc.dart';
import 'package:eportal/event/common_new/video_list_event.dart';
import 'package:eportal/model/api/request/common_new/data/video_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/video_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/video_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/video_item.dart';

class VideoPage extends BasePageWidget {
  const VideoPage({super.key});

  @override
  State<StatefulWidget> createState() => VideoPageState();
}

class VideoPageState
    extends BasePageState<VideoPage> {
  late VideoListBloc videoListBloc;
  VideoListEvent videoListEvent = VideoListEvent(request: VideoListRequest(obj: VideoListDataRequest()));

  @override
  void initBloc() {
    videoListBloc = VideoListBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    videoListBloc.close();
  }


  @override
  void getMoreData() {
    videoListEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    videoListEvent.request.obj.reloadData();
    callApi();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  void callApi() {
    videoListBloc.add(videoListEvent);
  }


  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => videoListBloc,
    child: BlocListener<VideoListBloc,
        DataPageState<VideoListDataResponse>>(
      listener: (BuildContext context, state) {},
      child: BlocBuilder<VideoListBloc,
          DataPageState<VideoListDataResponse>>(
          builder: (BuildContext context,
              DataPageState<VideoListDataResponse> state) =>
              handleDataPageState(
                  state,
                      (context, state) => Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Video",
                            style: AppTextStyle.titlePage.copyWith(
                                overflow: TextOverflow.visible,
                                fontSize: 18,
                                color: AppColor.colorOfIconActive),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              controller: scrollController,
                              itemCount: state.length,
                              itemBuilder:
                                  (BuildContext context, int index) => VideoItem(
                                data: state.elementAt(index),
                                onClickItem: (VideoListDataResponse value)  => {

                                },
                              )
                          ),
                        ),
                      ],
                    ),
                  ))),
    ),
  );
}