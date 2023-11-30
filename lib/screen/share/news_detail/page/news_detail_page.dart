import 'package:eportal/bloc/common_new/news_detail_bloc.dart';
import 'package:eportal/event/common_new/news_detail_event.dart';
import 'package:eportal/model/api/request/common_new/data/news_detail_data_request.dart';
import 'package:eportal/model/api/request/common_new/news_detail_request.dart';
import 'package:eportal/model/api/response/common_new/data/news_detail_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsDetailPage extends BasePage {
  int? id;

  NewsDetailPage({
    super.key,
    this.id,
  });

  @override
  State<StatefulWidget> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends BasePageState<NewsDetailPage> {
  NewsDetailBloc newsDetailBloc = NewsDetailBloc();

  @override
  void initDataLoading() {
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    newsDetailBloc.add(NewsDetailEvent(
        request:
            NewsDetailRequest(obj: NewsDetailDataRequest(id: widget.id ?? 0))));
    super.callApi();
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
            (context, state) => SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: TextIcon(
                      text: state?.title,
                      overflow: TextOverflow.visible,
                      icon: FontAwesomeIcons.tags,
                      textStyle: AppTextStyle.title.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      isHasBorder: false,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ImageLoading(
                          imageUrl: (state?.imagePath).getImageUrl(),
                          imageBuilder: (context, imageProvider) {
                            return Image(
                              image: imageProvider,
                              fit: BoxFit.fitHeight,
                            );
                          }),
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
          ),
        ),
      ));

  @override
  String getPageTitle(BuildContext context) => "Chi tiết tin tức";
}
