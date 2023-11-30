import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FaqQuestionSearchResponse
    extends BasePageEportalResponse<FaqQuestionSearchDataResponse> {
  FaqQuestionSearchResponse(
      {required super.data, required super.status, required super.message});

  factory FaqQuestionSearchResponse.fromJson(Map<String, dynamic> json) {
    return FaqQuestionSearchResponse(
        data: json.toListObjectJson(
            mapJson: (v) => FaqQuestionSearchDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
