import 'package:eportal/model/api/response/common_new/data/home_works_list_data_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_works_list_bloc.dart';
import '../../../../event/common_new/home_works_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/home_works_list_data_request.dart';
import '../../../../model/api/request/common_new/home_works_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/news/news_widget.dart';
import '../../work_search_detail/page/work_search_detail_page.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsRecruitment extends BasePage {
  int flag;

  NewsRecruitment({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => _NewsRecruitmentState();
}

class _NewsRecruitmentState extends BasePageStateActive<NewsRecruitment> {
  late HomeWorksListBloc homeWorksListCommonBloc;
  HomeWorksListRequest request = HomeWorksListRequest(obj: HomeWorksListDataRequest());
  @override
  void initBloc() {
    homeWorksListCommonBloc = HomeWorksListBloc();
    request.obj.flag = widget.flag;
  }

  @override
  void callApi() {
    // TODO: implement callApi
    homeWorksListCommonBloc.add(HomeWorksListEvent(
        request: request));
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeWorksListCommonBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.transparent;

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeWorksListCommonBloc,
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
            (context, state) => ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, i) => NewsWidget(
                      onTap: () => nextPage((context) => WorkSearchDetailPage(
                            id: state.elementAt(i).id,
                          )),
                      title: state.elementAt(i).title,
                      imageUrl: state.elementAt(i).imageURL,
                      time: state.elementAt(i).expiredDate.formatDateTimeApi(),
                    )),
          ),
        ),
      ));

}
