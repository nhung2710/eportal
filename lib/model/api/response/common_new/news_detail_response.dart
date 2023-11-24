//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

class NewsDetailResponse extends BaseSingleEportalResponse<String> {
  NewsDetailResponse(
      {required super.data, required super.status, required super.message});

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) {
    return NewsDetailResponse(
        data: json["data"], status: json["status"], message: json["message"]);
  }
}
