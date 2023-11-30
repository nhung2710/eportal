//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/danh_sach_gioi_tinh_data_response.dart';

class DanhSachGioiTinhResponse
    extends BaseMultiEportalResponse<DanhSachGioiTinhDataResponse> {
  DanhSachGioiTinhResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachGioiTinhResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachGioiTinhResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachGioiTinhDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
