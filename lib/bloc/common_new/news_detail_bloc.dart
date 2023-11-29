//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/news_detail_data_response.dart';
import 'package:eportal/model/api/response/common_new/news_detail_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/news_detail_event.dart';
import '../../repository/common_new/news_detail_repository.dart';
import '../../state/base/base_state.dart';

class NewsDetailBloc extends BaseSingleBloc<NewsDetailDataResponse,
    NewsDetailRepository, NewsDetailEvent, NewsDetailResponse> {
  @override
  Future<NewsDetailResponse> callApiResult(
          NewsDetailRepository apiRepository, NewsDetailEvent event) =>
      apiRepository.getNewsDetail(event.request);

  @override
  String? getFailMessage(NewsDetailResponse response) => null;

  @override
  NewsDetailRepository getRepository() => NewsDetailRepository();
}
