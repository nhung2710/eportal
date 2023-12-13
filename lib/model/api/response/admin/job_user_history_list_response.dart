//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/job_user_history_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class JobUserHistoryListResponse
    extends BaseSingleEportalResponse<JobUserHistoryListDataResponse> {
  JobUserHistoryListResponse(
      {required super.data, required super.status, required super.message});

  factory JobUserHistoryListResponse.fromJson(Map<String, dynamic> json) {
    return JobUserHistoryListResponse(
        data: json.toObjectJson(
            mapJson: (v) => JobUserHistoryListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
