import 'package:eportal/model/api/response/common_new/data/danh_sach_nhu_cau_viec_lam_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';
import 'package:flutter/material.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachNhuCauViecLamResponse
    extends BaseMultiEportalResponse<DanhSachNhuCauViecLamDataResponse> {
  DanhSachNhuCauViecLamResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachNhuCauViecLamResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachNhuCauViecLamResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachNhuCauViecLamDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
