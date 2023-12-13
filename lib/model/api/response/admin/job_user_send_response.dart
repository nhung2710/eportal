//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/job_user_send_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class JobUserSendResponse
    extends BaseSingleEportalResponse<JobUserSendDataResponse> {
  JobUserSendResponse(
      {required super.data, required super.status, required super.message});

  factory JobUserSendResponse.fromJson(Map<String, dynamic> json) {
    return JobUserSendResponse(
        data: json.toObjectJson(
            mapJson: (v) => JobUserSendDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
