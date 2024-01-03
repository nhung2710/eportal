//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/home_works_list_bloc.dart';
import 'package:eportal/event/common_new/home_works_list_event.dart';
import 'package:eportal/model/api/request/common_new/data/home_works_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/home_works_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_works_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/hiring/widget/hiring_item.dart';
import 'package:eportal/page/share/hiring_detail/page/hiring_detail_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HiringTab extends BasePageWidget {
  final int flag;
  const HiringTab({super.key,this.flag = 0});

  @override
  State<StatefulWidget> createState() => HiringTabState();
}

class HiringTabState
    extends BasePageState<HiringTab> {
  late HomeWorksListBloc homeWorksListBloc;
  HomeWorksListEvent homeWorksListEvent = HomeWorksListEvent(request: HomeWorksListRequest(obj: HomeWorksListDataRequest()));

  @override
  void initBloc() {
    homeWorksListBloc = HomeWorksListBloc();
    homeWorksListEvent.request.obj.flag = widget.flag;
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeWorksListBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    homeWorksListBloc.add(homeWorksListEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeWorksListBloc,
      child: BlocListener<HomeWorksListBloc,
          DataMultiState<HomeWorksListDataResponse>>(
        listener: (BuildContext context,
            DataMultiState<HomeWorksListDataResponse> state) {},
        child: BlocBuilder<HomeWorksListBloc,
            DataMultiState<HomeWorksListDataResponse>>(
          builder: (BuildContext context,
              DataMultiState<HomeWorksListDataResponse> state) =>
              handleDataMultiState<HomeWorksListDataResponse>(
                state,
                    (context, state) => Container(
                      margin: const EdgeInsets.all(10),
                      child: ListView(
                        shrinkWrap: true,
                        children: state.map((e) => HiringItem(data: e,
                          onClickItem: (HomeWorksListDataResponse value) {
                            nextPage((context) => HiringDetailPage(hiringId: value.id,));
                          },
                        )).toList(),),
                    ),
              ),
        ),
      ));

}