//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../model/api/request/common_new/news_search_request.dart';
import '../base/base_event.dart';

class NewsSearchEvent extends BasePageEvent<NewsSearchRequest> {
  const NewsSearchEvent({required super.request});
}
