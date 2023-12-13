//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/job_user_refer_delete_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class JobUserReferDeleteResponse
    extends BaseSingleEportalResponse<JobUserReferDeleteDataResponse> {
  JobUserReferDeleteResponse(
      {required super.data, required super.status, required super.message});

  factory JobUserReferDeleteResponse.fromJson(Map<String, dynamic> json) {
    return JobUserReferDeleteResponse(
        data: json.toObjectJson(
            mapJson: (v) => JobUserReferDeleteDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
