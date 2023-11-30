//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/danh_sach_tinh_tp_data_response.dart';

class DanhSachTinhTpResponse
    extends BaseMultiEportalResponse<DanhSachTinhTpDataResponse> {
  DanhSachTinhTpResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachTinhTpResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachTinhTpResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachTinhTpDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
