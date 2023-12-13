//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/work_send_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class WorkSendListResponse
    extends BaseSingleEportalResponse<WorkSendListDataResponse> {
  WorkSendListResponse(
      {required super.data, required super.status, required super.message});

  factory WorkSendListResponse.fromJson(Map<String, dynamic> json) {
    return WorkSendListResponse(
        data: json.toObjectJson(
            mapJson: (v) => WorkSendListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
