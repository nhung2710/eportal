//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/home_business_list_data_response.dart';

import '../../../base/base_eportal_response.dart';

class HomeBusinessListResponse extends BaseEportalResponse {
  List<HomeBusinessListDataResponse> data;

  HomeBusinessListResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeBusinessListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeBusinessListDataResponse> data = <HomeBusinessListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeBusinessListDataResponse.fromJson(v));
      });
    }
    return HomeBusinessListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
