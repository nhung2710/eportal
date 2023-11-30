import 'package:eportal/model/api/response/common_new/data/home_news_list_data_response.dart';
import 'package:eportal/screen/share/news_detail/page/news_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_news_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_news_list_event.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_news_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/expandable_fab/expandable_fab.dart';
import '../../../../widget/news/news_widget.dart';
import '../../news_search/page/news_search_page.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsPage extends BasePage {
  int flag;

  NewsPage({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends BasePageState<NewsPage> {
  HomeNewsListBloc homeNewsListBloc = HomeNewsListBloc();

  @override
  void initDataLoading() {
    homeNewsListBloc.add(HomeNewsListEvent(
        request: HomeNewsListRequest(
            obj: CommonNewDataRequest(
                flag: widget.flag,
                top: ApplicationConstant.NUMBER_PREVIEW_ITEM))));
    super.initDataLoading();
  }

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
            (context, state) => ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, i) => NewsWidget(
                      onTap: () => nextPage((context) => NewsDetailPage(
                            id: state.elementAt(i).newId,
                          )),
                      title: state.elementAt(i).title,
                      imageUrl: state.elementAt(i).imagePath,
                      content: state.elementAt(i).summary,
                      time: state.elementAt(i).publishedDate,
                    )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Tin tức";
}
