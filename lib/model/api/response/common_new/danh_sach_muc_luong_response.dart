//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/danh_sach_muc_luong_data_response.dart';

class DanhSachMucLuongResponse
    extends BaseMultiEportalResponse<DanhSachMucLuongDataResponse> {
  DanhSachMucLuongResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachMucLuongResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachMucLuongResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachMucLuongDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
