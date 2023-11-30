//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/home_job_user_list_data_response.dart';

class HomeJobUserListResponse
    extends BaseMultiEportalResponse<HomeJobUserListDataResponse> {
  HomeJobUserListResponse(
      {required super.data, required super.status, required super.message});

  factory HomeJobUserListResponse.fromJson(Map<String, dynamic> json) {
    return HomeJobUserListResponse(
        data: json.toListObjectJson(
            mapJson: (v) => HomeJobUserListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
