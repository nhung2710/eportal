//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/bloc/common_new/home_news_list_bloc.dart';
import 'package:eportal/bloc/common_new/news_detail_bloc.dart';
import 'package:eportal/event/common_new/home_news_list_event.dart';
import 'package:eportal/model/api/request/common_new/data/home_news_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/home_news_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/news_detail_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/news_detail_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/news_detail_data_request.dart';
import '../../../../model/api/request/common_new/news_detail_request.dart';


class NewsDetailPage extends BasePageWidget {
  final String? newId;

  const NewsDetailPage({super.key, required this.newId});

  @override
  State<StatefulWidget> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends BasePageState<NewsDetailPage> {
  late NewsDetailBloc newsDetailBloc;
  NewsDetailEvent newsDetailEvent = NewsDetailEvent(request: NewsDetailRequest(obj: NewsDetailDataRequest()));

  @override
  void initBloc() {
    newsDetailBloc = NewsDetailBloc();
    newsDetailEvent.request.obj.id = widget.newId;
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void callApi() {
    newsDetailBloc.add(newsDetailEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => newsDetailBloc,
      child:
      BlocListener<NewsDetailBloc, DataSingleState<NewsDetailDataResponse>>(
        listener: (BuildContext context,
            DataSingleState<NewsDetailDataResponse> state) {},
        child: BlocBuilder<NewsDetailBloc,
            DataSingleState<NewsDetailDataResponse>>(
          builder: (BuildContext context,
              DataSingleState<NewsDetailDataResponse> state) =>
              handleDataSingleState<NewsDetailDataResponse>(
                state,
                    (context, state) => Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Chi tiết tin tức",
                              style: AppTextStyle.titlePage.copyWith(
                                  overflow: TextOverflow.visible,
                                  fontSize: 18,
                                  color: AppColor.colorOfIconActive),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [

                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Text(
                                      (state?.title).supportHtml(),
                                      textAlign: TextAlign.center,
                                      style:  AppTextStyle.title.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.visible),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: ClipRRect(
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(5.0)),
                                        child: ImageLoading(
                                            imageUrl: (state?.imagePath).getImageUrl(),
                                            imageBuilder: (context, imageProvider) {
                                              return Image(
                                                image: imageProvider,
                                                fit: BoxFit.fill,
                                              );
                                            }
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Html(
                                      data: (state?.content).replaceWhenNullOrWhiteSpace(),
                                      style: {
                                        '#': Style(
                                          fontSize: FontSize(16),
                                        ),
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              ),
        ),
      ));

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
}