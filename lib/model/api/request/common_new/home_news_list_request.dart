import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/home_news_list_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeNewsListRequest extends BaseEportalRequest<HomeNewsListDataRequest> {
  HomeNewsListRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_MEDIUM_DEFAULT;

  @override
  String getQuery() => ApplicationApiConstant.kAPI_COMMON_NEW_OP_HOME_NEWS_LIST;
}
