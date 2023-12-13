//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/work_add_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class WorkAddResponse extends BaseSingleEportalResponse<WorkAddDataResponse> {
  WorkAddResponse(
      {required super.data, required super.status, required super.message});

  factory WorkAddResponse.fromJson(Map<String, dynamic> json) {
    return WorkAddResponse(
        data:
            json.toObjectJson(mapJson: (v) => WorkAddDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
