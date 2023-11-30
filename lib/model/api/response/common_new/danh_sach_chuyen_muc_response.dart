import 'package:eportal/model/api/response/common_new/data/danh_sach_chuyen_muc_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChuyenMucResponse
    extends BaseMultiEportalResponse<DanhSachChuyenMucDataResponse> {
  DanhSachChuyenMucResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachChuyenMucResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachChuyenMucResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachChuyenMucDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
