import 'package:eportal/model/api/response/common_new/data/job_user_add_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';
import 'package:flutter/material.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserAddResponse
    extends BaseSingleEportalResponse<JobUserAddDataResponse> {
  JobUserAddResponse(
      {required super.data, required super.status, required super.message});

  factory JobUserAddResponse.fromJson(Map<String, dynamic> json) {
    return JobUserAddResponse(
        data: json.toObjectJson(
            mapJson: (v) => JobUserAddDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
