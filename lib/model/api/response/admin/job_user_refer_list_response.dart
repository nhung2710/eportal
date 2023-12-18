//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/job_user_refer_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class JobUserReferListResponse
    extends BaseMultiEportalResponse<JobUserReferListDataResponse> {
  JobUserReferListResponse(
      {required super.data, required super.status, required super.message});

  factory JobUserReferListResponse.fromJson(Map<String, dynamic> json) {
    return JobUserReferListResponse(
        data: json.toListObjectJson(
            mapJson: (v) => JobUserReferListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
