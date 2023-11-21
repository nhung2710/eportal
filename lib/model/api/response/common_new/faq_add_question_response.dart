import 'package:eportal/model/api/response/common_new/data/faq_add_question_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FaqAddQuestionResponse extends BaseEportalResponse {
  List<FaqAddQuestionDataResponse> data;

  FaqAddQuestionResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory FaqAddQuestionResponse.fromJson(Map<String, dynamic> json) {
    List<FaqAddQuestionDataResponse> data = <FaqAddQuestionDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(FaqAddQuestionDataResponse.fromJson(v));
      });
    }
    return FaqAddQuestionResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
