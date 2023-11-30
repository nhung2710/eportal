//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/common_new/data/job_user_detail_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class JobUserDetailResponse
    extends BaseSingleEportalResponse<JobUserDetailDataResponse> {
  JobUserDetailResponse(
      {required super.data, required super.status, required super.message});

  factory JobUserDetailResponse.fromJson(Map<String, dynamic> json) {
    return JobUserDetailResponse(
        data: json.toObjectJson(
            mapJson: (v) => JobUserDetailDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
