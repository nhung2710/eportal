//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/bloc/common_new/home_news_list_bloc.dart';
import 'package:eportal/model/api/request/common_new/data/home_news_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/home_news_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_news_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/share/news/widget/news_item.dart';
import 'package:eportal/page/share/news_search/page/news_search_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/news/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/common_new/home_news_list_event.dart';
import '../../../base/page_widget/base_page_widget.dart';

class NewsPage extends BasePageWidget {
  final int flag;

  const NewsPage({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => NewsPageState();
}

class NewsPageState extends BasePageState<NewsPage> {
  late HomeNewsListBloc homeNewsListBloc;
  HomeNewsListEvent homeNewsListEvent = HomeNewsListEvent(request: HomeNewsListRequest(obj: HomeNewsListDataRequest()));

  @override
  void initBloc() {
    homeNewsListBloc = HomeNewsListBloc();
  }

  @override
  void callApi() {
    // TODO: implement callApi
    homeNewsListBloc.add(homeNewsListEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeNewsListBloc.close();
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
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
    children: [
      ActionButton(
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () => nextPage((context) => const NewsSearchPage()),
      ),
    ],
  );

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeNewsListBloc,
      child: BlocListener<HomeNewsListBloc,
          DataMultiState<HomeNewsListDataResponse>>(
        listener: (BuildContext context,
            DataMultiState<HomeNewsListDataResponse> state) {},
        child: BlocBuilder<HomeNewsListBloc,
            DataMultiState<HomeNewsListDataResponse>>(
          builder: (BuildContext context,
              DataMultiState<HomeNewsListDataResponse> state) =>
              handleDataMultiState<HomeNewsListDataResponse>(
                state,
                    (context, state) => Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Tin tức tổng hợp",
                              style: AppTextStyle.titlePage.copyWith(
                                  overflow: TextOverflow.visible,
                                  fontSize: 18,
                                  color: AppColor.colorOfIconActive),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                            shrinkWrap: true,
                            children: state.map((e) => NewsItem(data:e)).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
        ),
      ));

}