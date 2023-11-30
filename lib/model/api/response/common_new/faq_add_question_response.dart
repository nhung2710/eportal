import 'package:eportal/model/api/response/common_new/data/faq_add_question_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FaqAddQuestionResponse
    extends BaseSingleEportalResponse<FaqAddQuestionDataResponse> {
  FaqAddQuestionResponse(
      {required super.data, required super.status, required super.message});

  factory FaqAddQuestionResponse.fromJson(Map<String, dynamic> json) {
    return FaqAddQuestionResponse(
        data: json.toObjectJson(
            mapJson: (v) => FaqAddQuestionDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
