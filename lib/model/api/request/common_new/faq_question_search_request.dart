import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/faq_question_search_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FaqQuestionSearchRequest
    extends BasePageEportalRequest<FaqQuestionSearchDataRequest> {
  FaqQuestionSearchRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_LOW_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_FAQ_QUESTION_SEARCH;
}
