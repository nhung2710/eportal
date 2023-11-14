import 'package:eportal/model/api/response/common_new/data/common_new_data.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/home_slide_list_data.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeSlideListResponse extends BaseEportalResponse {
  List<HomeSlideListData>? data;

  HomeSlideListResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeSlideListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeSlideListData> data = <HomeSlideListData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeSlideListData.fromJson(v));
      });
    }
    return HomeSlideListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
