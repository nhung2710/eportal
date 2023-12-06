import 'package:eportal/model/api/response/common_new/data/danh_sach_nhu_cau_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachNhuCauResponse
    extends BaseMultiEportalResponse<DanhSachNhuCauDataResponse> {
  DanhSachNhuCauResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachNhuCauResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachNhuCauResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachNhuCauDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
