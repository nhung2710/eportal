//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/common_new/data/job_user_search_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class JobUserSearchResponse
    extends BasePageEportalResponse<JobUserSearchDataResponse> {
  JobUserSearchResponse(
      {required super.data, required super.status, required super.message});

  factory JobUserSearchResponse.fromJson(Map<String, dynamic> json) {
    return JobUserSearchResponse(
        data: json.toListObjectJson(
            mapJson: (v) => JobUserSearchDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
