import 'package:eportal/model/api/response/common_new/data/news_search_data_response.dart';
import 'package:eportal/screen/share/news_detail/page/news_detail_page.dart';
import 'package:eportal/widget/dialog/filter_news_dialog.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/news_search_bloc.dart';
import '../../../../event/common_new/news_search_event.dart';
import '../../../../model/api/request/common_new/data/news_search_data_request.dart';
import '../../../../model/api/request/common_new/news_search_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/news/news_widget.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsSearchPage extends BasePage {
  const NewsSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsSearchPageState();
}

class _NewsSearchPageState extends BasePageState<NewsSearchPage> {
  late NewsSearchBloc newsSearchBloc;
  NewsSearchRequest request =
      NewsSearchRequest(obj: NewsSearchDataRequest(tuKhoa: ""));
  TextEditingController textEditingController = TextEditingController();

  final filterNewsDialogKey = GlobalKey<FilterNewsDialogState>();
  late FilterNewsDialog filterNewsDialog = FilterNewsDialog(
    key: filterNewsDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );

  @override
  void initBloc() {
    newsSearchBloc = NewsSearchBloc();
  }

  @override
  void initDataLoading() {
    request.obj.soTrangHienTai = 1;
    request.obj.tuKhoa = textEditingController.text;
    callApi();
    super.initDataLoading();
  }

  @override
  void getMoreData() {
    request.obj.soTrangHienTai++;
    callApi();
    super.getMoreData();
  }

  @override
  void callApi() {
    newsSearchBloc.add(NewsSearchEvent(request: request));
  }

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            color: Colors.white,
            child: SearchInput(
              controller: textEditingController,
              maxLength: 50,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (value) => initDataLoading(),
              icon: Icons.search,
              onTap: () {
                initDataLoading();
              },
              onTapFilter: () {
                showDialog(context: context, builder: (_) => filterNewsDialog);
              },
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: BlocProvider(
                create: (_) => newsSearchBloc,
                child: BlocListener<NewsSearchBloc,
                    DataPageState<NewsSearchDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<NewsSearchDataResponse> state) {},
                  child: BlocBuilder<NewsSearchBloc,
                      DataPageState<NewsSearchDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<NewsSearchDataResponse> state) =>
                        handleDataPageState<NewsSearchDataResponse>(
                      state,
                      (context, state) => ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: state.length,
                          itemBuilder: (context, i) => GestureDetector(
                                onTap: () =>
                                    nextPage((context) => NewsDetailPage(
                                          id: state.elementAt(i).newId,
                                        )),
                                child: NewsWidget(
                                  title: state.elementAt(i).title,
                                  imageUrl: state.elementAt(i).imagePath,
                                  content: state.elementAt(i).summary,
                                ),
                              )),
                    ),
                  ),
                )),
          ),
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Tìm kiếm";

  void _findNews(BuildContext context) {
    if (isValid()) {
      request.obj.tuKhoa = textEditingController.text;
      newsSearchBloc.add(NewsSearchEvent(request: request));
    }
  }
}
