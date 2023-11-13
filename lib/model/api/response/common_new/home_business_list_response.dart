//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


import 'package:eportal/model/api/response/common_new/data/common_new_data.dart';
import 'package:eportal/model/api/response/common_new/data/home_business_list_data.dart';

import '../../../base/base_eportal_response.dart';

class HomeBusinessListResponse extends BaseEportalResponse {
  List<HomeBusinessListData>? data;

  HomeBusinessListResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeBusinessListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeBusinessListData> data = <HomeBusinessListData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeBusinessListData.fromJson(v));
      });
    }
    return HomeBusinessListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
