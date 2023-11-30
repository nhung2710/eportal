//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class WorkSearchResponse
    extends BasePageEportalResponse<WorkSearchDataResponse> {
  WorkSearchResponse(
      {required super.data, required super.status, required super.message});

  factory WorkSearchResponse.fromJson(Map<String, dynamic> json) {
    return WorkSearchResponse(
        data: json.toListObjectJson(
            mapJson: (v) => WorkSearchDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
