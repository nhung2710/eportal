import 'package:eportal/model/api/response/common_new/data/danh_sach_vi_tri_tuyen_dung_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachViTriTuyenDungResponse
    extends BaseMultiEportalResponse<DanhSachViTriTuyenDungDataResponse> {
  DanhSachViTriTuyenDungResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachViTriTuyenDungResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachViTriTuyenDungResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachViTriTuyenDungDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
