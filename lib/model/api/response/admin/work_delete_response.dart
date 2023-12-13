//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/work_delete_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class WorkDeleteResponse
    extends BaseSingleEportalResponse<WorkDeleteDataResponse> {
  WorkDeleteResponse(
      {required super.data, required super.status, required super.message});

  factory WorkDeleteResponse.fromJson(Map<String, dynamic> json) {
    return WorkDeleteResponse(
        data: json.toObjectJson(
            mapJson: (v) => WorkDeleteDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
