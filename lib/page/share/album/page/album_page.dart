//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/album_list_bloc.dart';
import 'package:eportal/event/common_new/album_list_event.dart';
import 'package:eportal/model/api/request/common_new/album_list_request.dart';
import 'package:eportal/model/api/request/common_new/data/album_list_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/album_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/album/widget/album_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumPage extends BasePageWidget {
  const AlbumPage({super.key});

  @override
  State<StatefulWidget> createState() => AlbumPageState();
}

class AlbumPageState
    extends BasePageState<AlbumPage> {
  late AlbumListBloc albumListBloc;
  AlbumListEvent albumListEvent = AlbumListEvent(request: AlbumListRequest(obj: AlbumListDataRequest()));

  @override
  void initBloc() {
    albumListBloc = AlbumListBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    albumListBloc.close();
  }


  @override
  void getMoreData() {
    albumListEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    albumListEvent.request.obj.reloadData();
    callApi();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  void callApi() {
    albumListBloc.add(albumListEvent);
  }


  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => albumListBloc,
    child: BlocListener<AlbumListBloc,
        DataPageState<AlbumListDataResponse>>(
      listener: (BuildContext context, state) {},
      child: BlocBuilder<AlbumListBloc,
          DataPageState<AlbumListDataResponse>>(
          builder: (BuildContext context,
              DataPageState<AlbumListDataResponse> state) =>
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
                            "Album",
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
                                  (BuildContext context, int index) => AlbumItem(
                                data: state.elementAt(index),
                                onClickItem: (AlbumListDataResponse value)  => nextPage((context) => AlbumItem(
                                  data:value,
                                  onClickItem: (AlbumListDataResponse value) {

                                  },)),
                              )
                          ),
                        ),
                      ],
                    ),
                  ))),
    ),
  );
}