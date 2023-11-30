import 'package:eportal/model/api/response/common_new/data/danh_sach_loai_van_ban_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachLoaiVanBanResponse
    extends BaseMultiEportalResponse<DanhSachLoaiVanBanDataResponse> {
  DanhSachLoaiVanBanResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachLoaiVanBanResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachLoaiVanBanResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachLoaiVanBanDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
