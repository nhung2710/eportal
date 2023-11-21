import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/home_works_list_data_response.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListResponse extends BaseEportalResponse {
  List<HomeWorksListDataResponse>? data;

  HomeWorksListResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeWorksListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeWorksListDataResponse> data = <HomeWorksListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeWorksListDataResponse.fromJson(v));
      });
    }
    return HomeWorksListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
