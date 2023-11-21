import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/faq_question_search_request.dart';
import 'package:eportal/model/api/response/common_new/faq_question_search_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FaqQuestionSearchRepository {
  Future<FaqQuestionSearchResponse> getFaqQuestionSearch(
      FaqQuestionSearchRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => FaqQuestionSearchResponse.fromJson(value));
  }
}
