import 'package:eportal/model/api/request/common_new/faq_question_search_request.dart';
import 'package:eportal/model/api/response/common_new/faq_question_search_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FaqQuestionSearchRepository extends BaseRepository<
    FaqQuestionSearchRequest, FaqQuestionSearchResponse> {
  @override
  FaqQuestionSearchResponse mapJsonToObject(Map<String, dynamic> value) =>
      FaqQuestionSearchResponse.fromJson(value);
}
