import 'package:eportal/bloc/common_new/album_list_bloc.dart';
import 'package:eportal/event/common_new/album_list_event.dart';
import 'package:eportal/model/api/request/common_new/album_list_request.dart';
import 'package:eportal/model/api/request/common_new/data/album_list_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/album_list_data_response.dart';
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

class MediaImageManagePage extends BasePage {
  const MediaImageManagePage({super.key});

  @override
  State<StatefulWidget> createState() => MediaImageManagePageState();
}

class MediaImageManagePageState
    extends BasePageStateActive<MediaImageManagePage> {
  AlbumListBloc albumListBloc = AlbumListBloc();
  AlbumListDataRequest request = AlbumListDataRequest();

  @override
  void getMoreData() {
    request.soTrangHienTai++;
    callApi();
  }

  @override
  void callApi() {
    albumListBloc.add(AlbumListEvent(request: AlbumListRequest(obj: request)));
  }

  @override
  void initDataLoading() {
    request.soTrangHienTai = 1;
    callApi();
    super.initDataLoading();
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => albumListBloc,
      child: BlocListener<AlbumListBloc, DataPageState<AlbumListDataResponse>>(
        listener: (BuildContext context,
            DataPageState<AlbumListDataResponse> state) {},
        child: BlocBuilder<AlbumListBloc, DataPageState<AlbumListDataResponse>>(
            builder: (BuildContext context,
                    DataPageState<AlbumListDataResponse> state) =>
                handleDataPageState(
                  state,
                  (context, state) => Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            controller: scrollController,
                            itemCount: state.length,
                            itemBuilder: (context, i) => const NewsWidget()),
                      ),
                    ],
                  ),
                )),
      ));
}
