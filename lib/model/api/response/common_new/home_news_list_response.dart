import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/home_news_list_data_response.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeNewsListResponse extends BaseEportalResponse {
  List<HomeNewsListDataResponse>? data;

  HomeNewsListResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeNewsListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeNewsListDataResponse> data = <HomeNewsListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeNewsListDataResponse.fromJson(v));
      });
    }
    return HomeNewsListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
