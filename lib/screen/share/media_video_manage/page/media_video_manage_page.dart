import 'package:eportal/bloc/common_new/video_list_bloc.dart';
import 'package:eportal/event/common_new/video_list_event.dart';
import 'package:eportal/model/api/request/common_new/data/video_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/video_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/video_list_data_response.dart';
import 'package:eportal/screen/share/video/page/video_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/news/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class MediaVideoManagePage extends BasePage {
  const MediaVideoManagePage({super.key});

  @override
  State<StatefulWidget> createState() => MediaVideoManagePageState();
}

class MediaVideoManagePageState
    extends BasePageStateActive<MediaVideoManagePage> {
  late VideoListBloc videoListBloc;
  VideoListRequest request = VideoListRequest(obj: VideoListDataRequest());

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
    request.obj.nextData();
    callApi();
  }

  @override
  void callApi() {
    videoListBloc.add(VideoListEvent(request: request));
  }

  @override
  void initDataLoading() {
    request.obj.reloadData();
    callApi();
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => videoListBloc,
      child: BlocListener<VideoListBloc, DataPageState<VideoListDataResponse>>(
        listener: (BuildContext context,
            DataPageState<VideoListDataResponse> state) {},
        child: BlocBuilder<VideoListBloc, DataPageState<VideoListDataResponse>>(
            builder: (BuildContext context,
                    DataPageState<VideoListDataResponse> state) =>
                handleDataPageState(
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
