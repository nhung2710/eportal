import 'package:eportal/bloc/common_new/video_list_bloc.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/api/response/common_new/video_list_response.dart';
import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/screen/share/video/page/video_page.dart';
import 'package:eportal/state/base/base_state.dart';
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
  VideoListBloc videoListBloc = VideoListBloc();
  VideoListDataRequest request = VideoListDataRequest();

  @override
  void getMoreData() {
    request.soTrangHienTai++;
    videoListBloc.add(VideoListEvent(request: VideoListRequest(obj: request)));
  }

  @override
  void initDataLoading() {
    request = VideoListDataRequest();
    request.soTrangHienTai = 1;
    videoListBloc.add(VideoListEvent(request: VideoListRequest(obj: request)));
    super.initDataLoading();
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => videoListBloc,
      child: BlocListener<VideoListBloc, DataMoreState<VideoListDataResponse>>(
        listener: (BuildContext context,
            DataMoreState<VideoListDataResponse> state) {},
        child: BlocBuilder<VideoListBloc, DataMoreState<VideoListDataResponse>>(
            builder: (BuildContext context,
                    DataMoreState<VideoListDataResponse> state) =>
                handleDataMoreState(
                  state,
                  (context, state) => Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            controller: scrollController,
                            itemCount: state.length,
                            itemBuilder: (context, i) => NewsWidget(
                                  onTap: () => nextPage((context) =>
                                      VideoPage(data: state.elementAt(i))),
                                  title: state.elementAt(i).name,
                                  imageUrl: state.elementAt(i).avatar,
                                  content: state.elementAt(i).summary,
                                  time: state.elementAt(i).publishedDate,
                                )),
                      ),
                    ],
                  ),
                )),
      ));
}
