import 'package:eportal/model/api/response/admin/data/job_user_update_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserUpdateResponse
    extends BaseSingleEportalResponse<JobUserUpdateDataResponse> {
  JobUserUpdateResponse(
      {required super.data, required super.status, required super.message});

  factory JobUserUpdateResponse.fromJson(Map<String, dynamic> json) {
    return JobUserUpdateResponse(
        data: json.toObjectJson(
            mapJson: (v) => JobUserUpdateDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
