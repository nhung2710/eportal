import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/faq_add_question_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FaqAddQuestionRequest
    extends BaseEportalRequest<FaqAddQuestionDataRequest> {
  FaqAddQuestionRequest({required super.obj});

  @override
  String getQuery() =>
      ApplicationApiConstant.kAPI_COMMON_NEW_OP_FAQ_ADD_QUESTION;
}
