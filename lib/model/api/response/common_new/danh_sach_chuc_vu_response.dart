import 'package:eportal/model/api/response/common_new/data/danh_sach_chuc_vu_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChucVuResponse
    extends BaseMultiEportalResponse<DanhSachChucVuDataResponse> {
  DanhSachChucVuResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachChucVuResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachChucVuResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachChucVuDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
