import 'package:eportal/model/api/response/common_new/data/danh_sach_co_quan_ban_hanh_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachCoQuanBanHanhResponse
    extends BaseMultiEportalResponse<DanhSachCoQuanBanHanhDataResponse> {
  DanhSachCoQuanBanHanhResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachCoQuanBanHanhResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachCoQuanBanHanhResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachCoQuanBanHanhDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
