//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/home_job_user_list_data_response.dart';

class HomeJobUserListResponse extends BaseEportalResponse {
  List<HomeJobUserListDataResponse> data;

  HomeJobUserListResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeJobUserListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeJobUserListDataResponse> data = <HomeJobUserListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeJobUserListDataResponse.fromJson(v));
      });
    }
    return HomeJobUserListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
