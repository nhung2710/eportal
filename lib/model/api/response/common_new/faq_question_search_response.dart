import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FaqQuestionSearchResponse
    extends BasePageEportalResponse<FaqQuestionSearchDataResponse> {
  FaqQuestionSearchResponse(
      {required super.data, required super.status, required super.message});

  factory FaqQuestionSearchResponse.fromJson(Map<String, dynamic> json) {
    List<FaqQuestionSearchDataResponse> data =
        <FaqQuestionSearchDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(FaqQuestionSearchDataResponse.fromJson(v));
      });
    }
    return FaqQuestionSearchResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
