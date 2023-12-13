//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/work_view_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class WorkViewListResponse
    extends BaseSingleEportalResponse<WorkViewListDataResponse> {
  WorkViewListResponse(
      {required super.data, required super.status, required super.message});

  factory WorkViewListResponse.fromJson(Map<String, dynamic> json) {
    return WorkViewListResponse(
        data: json.toObjectJson(
            mapJson: (v) => WorkViewListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
