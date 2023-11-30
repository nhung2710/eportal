//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/home_business_list_data_response.dart';

import '../../../../extension/map_json_extension.dart';
import '../../../base/base_eportal_response.dart';

class HomeBusinessListResponse
    extends BaseMultiEportalResponse<HomeBusinessListDataResponse> {
  HomeBusinessListResponse(
      {required super.data, required super.status, required super.message});

  factory HomeBusinessListResponse.fromJson(Map<String, dynamic> json) {
    return HomeBusinessListResponse(
        data: json.toListObjectJson(
            mapJson: (v) => HomeBusinessListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
