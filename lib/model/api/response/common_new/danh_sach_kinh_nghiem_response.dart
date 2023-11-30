//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/danh_sach_kinh_nghiem_data_response.dart';

class DanhSachKinhNghiemResponse
    extends BaseMultiEportalResponse<DanhSachKinhNghiemDataResponse> {
  DanhSachKinhNghiemResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachKinhNghiemResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachKinhNghiemResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachKinhNghiemDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
