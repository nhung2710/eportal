//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/danh_sach_quan_huyen_data_response.dart';

class DanhSachQuanHuyenResponse
    extends BaseMultiEportalResponse<DanhSachQuanHuyenDataResponse> {
  DanhSachQuanHuyenResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachQuanHuyenResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachQuanHuyenResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachQuanHuyenDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
