//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class WorkSearchByUserNameResponse
    extends BaseSingleEportalResponse<WorkSearchByUserNameDataResponse> {
  WorkSearchByUserNameResponse(
      {required super.data, required super.status, required super.message});

  factory WorkSearchByUserNameResponse.fromJson(Map<String, dynamic> json) {
    return WorkSearchByUserNameResponse(
        data: json.toObjectJson(
            mapJson: (v) => WorkSearchByUserNameDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
