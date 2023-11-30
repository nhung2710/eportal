//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/common_new/data/danh_sach_trinh_do_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class DanhSachTrinhDoResponse
    extends BaseMultiEportalResponse<DanhSachTrinhDoDataResponse> {
  DanhSachTrinhDoResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachTrinhDoResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachTrinhDoResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachTrinhDoDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
