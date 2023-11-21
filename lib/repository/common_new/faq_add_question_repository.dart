import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/faq_add_question_request.dart';
import 'package:eportal/model/api/response/common_new/faq_add_question_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FaqAddQuestionRepository {
  Future<FaqAddQuestionResponse> getFaqAddQuestion(
      FaqAddQuestionRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => FaqAddQuestionResponse.fromJson(value));
  }
}
