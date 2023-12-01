import 'package:eportal/model/api/request/common_new/faq_add_question_request.dart';
import 'package:eportal/model/api/response/common_new/faq_add_question_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FaqAddQuestionRepository
    extends BaseRepository<FaqAddQuestionRequest, FaqAddQuestionResponse> {
  @override
  FaqAddQuestionResponse mapJsonToObject(Map<String, dynamic> value) =>
      FaqAddQuestionResponse.fromJson(value);
}
