import 'package:eportal/model/api/response/common_new/data/news_search_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/news_search_bloc.dart';
import '../../../../event/common_new/news_search_event.dart';
import '../../../../model/api/request/common_new/data/news_search_data_request.dart';
import '../../../../model/api/request/common_new/news_search_request.dart';
import '../../../../model/api/response/common_new/news_search_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_text_style.dart';
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
  NewsSearchBloc newsSearchBloc = NewsSearchBloc();
  NewsSearchRequest request =
      NewsSearchRequest(obj: NewsSearchDataRequest(tuKhoa: ""));
  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    request.obj.soTrangHienTai = 1;
    newsSearchBloc.add(NewsSearchEvent(request: request));
    super.initDataLoading();
  }

  @override
  void getMoreData() {
    request.obj.soTrangHienTai++;
    newsSearchBloc.add(NewsSearchEvent(request: request));
    super.getMoreData();
  }

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            color: Colors.white,
            child: TextFormField(
              controller: textEditingController,
              maxLength: 100,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (value) => _findNews(context),
              decoration: InputDecoration(
                isDense: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _findNews(context);
                  },
                ),
                hintText: 'Tìm kiếm',
                counterText: "",
              ),
              style: AppTextStyle.normal,
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
                          itemBuilder: (context, i) => NewsWidget(
                                title: state.elementAt(i).title,
                                imageUrl: state.elementAt(i).imagePath,
                                content: state.elementAt(i).summary,
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
