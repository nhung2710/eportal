//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'dart:convert';

import 'package:eportal/model/api/response/common_new/data/news_search_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

class NewsSearchResponse extends BaseEportalResponse {
  List<NewsSearchDataResponse> data;

  NewsSearchResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory NewsSearchResponse.fromJson(Map<String, dynamic> json) {
    List<NewsSearchDataResponse> data = <NewsSearchDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(NewsSearchDataResponse.fromJson(v));
      });
    }
    return NewsSearchResponse(
        data: data, status: json["status"], message: json["message"]);
  }

  @override
  String toString() {
    return json.encode(data);
  }
}
