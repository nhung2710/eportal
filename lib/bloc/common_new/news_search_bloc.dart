//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/model/api/response/common_new/data/news_search_data_response.dart';
import 'package:eportal/model/api/response/common_new/news_search_response.dart';

import '../../event/common_new/news_search_event.dart';
import '../../repository/common_new/news_search_repository.dart';

class NewsSearchBloc extends BasePageBloc<NewsSearchDataResponse,
    NewsSearchRepository, NewsSearchEvent, NewsSearchResponse> {
  @override
  Future<NewsSearchResponse> callApiResult(
          NewsSearchRepository apiRepository, NewsSearchEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(NewsSearchResponse response) => null;

  @override
  NewsSearchRepository getRepository() => NewsSearchRepository();
}
