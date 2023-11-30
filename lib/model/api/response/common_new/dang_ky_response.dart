import 'package:eportal/model/api/response/common_new/data/dang_ky_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangKyResponse extends BaseSingleEportalResponse<DangKyDataResponse> {
  DangKyResponse(
      {required super.data, required super.status, required super.message});

  factory DangKyResponse.fromJson(Map<String, dynamic> json) {
    return DangKyResponse(
        data: json.toObjectJson(mapJson: (v) => DangKyDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
