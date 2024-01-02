//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/news_search_bloc.dart';
import 'package:eportal/model/api/request/common_new/news_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/news_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/share/news_detail/page/news_detail_page.dart';
import 'package:eportal/page/share/news_search/page/news_search_filter_page.dart';
import 'package:eportal/page/share/news_search/widget/news_search_item.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/dialog/filter_news_dialog.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:eportal/widget/news/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/news_search_event.dart';
import '../../../../model/api/request/common_new/data/news_search_data_request.dart';
import '../../../base/page_widget/base_page_widget.dart';

class NewsSearchPage extends BasePageWidget {
  const NewsSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => NewsSearchPageState();
}

class NewsSearchPageState extends BasePageState<NewsSearchPage> {
  late NewsSearchBloc newsSearchBloc;
  NewsSearchEvent newsSearchEvent = NewsSearchEvent(request: NewsSearchRequest(obj: NewsSearchDataRequest()));
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    newsSearchBloc = NewsSearchBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    newsSearchBloc.close();
  }

  @override
  void initDataLoading() {
    newsSearchEvent.request.obj.reloadData();
    callApi();
  }

  @override
  void getMoreData() {
    newsSearchEvent.request.obj.nextData();
    callApi();
  }

  @override
  void callApi() {
    newsSearchEvent.request.obj.tuKhoa = textEditingController.text;
    newsSearchBloc.add(newsSearchEvent);
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(
    title: Text(
      getPageTitle(context),
      style: AppTextStyle.titleAppbarPage,
    ),
    backgroundColor: AppColor.colorOfIcon,
    automaticallyImplyLeading: true,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: GestureDetector(
            onTap: () {
              nextPage((context) => NewsSearchFilterPage(data:newsSearchEvent)).then((value) {
                if(value!=null) {
                  newsSearchEvent = value;
                  initDataLoading();
                }
              });
            },
            child: const Icon(
              FontAwesomeIcons.filter,
              color: Colors.white,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
        ),
      )
    ],
  );



  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Tìm kiếm tin tức tổng hợp",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5, top: 5),
          color: Colors.white,
          child: DefaultSearchFormField(
            controller: textEditingController,
            icon: FontAwesomeIcons.magnifyingGlass,
            maxLength: 100,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (value) => initDataLoading(),
            hintText: "Nội dung tìm kiếm",
            labelText: "Nội dung tìm kiếm",
            helperText: "Ví dụ: abc",
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
                            (context, state) => ListView(
                            controller: scrollController,
                            shrinkWrap: true,
                            children: state.map((e) => NewsSearchItem(data: e, onClickItem: (NewsSearchDataResponse value) =>
                              nextPage((context) => NewsDetailPage(
                                newId: value.newId,
                              )))).toList()),
                      ),
                ),
              )),
        ),
      ],
    ),
  );



  void _findNews(BuildContext context) {
    if (isValid()) {
      newsSearchEvent.request.obj.tuKhoa = textEditingController.text;
      newsSearchBloc.add(newsSearchEvent);
    }
  }
}