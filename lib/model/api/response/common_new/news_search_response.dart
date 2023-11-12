//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

class NewsSearchResponse extends BaseEportalResponse {
  String? data;

  NewsSearchResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory NewsSearchResponse.fromJson(Map<String, dynamic> json) {
    return NewsSearchResponse(
        data: json["data"], status: json["status"], message: json["message"]);
  }
}
