//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_muc_luong_data_response.dart';

class DanhSachMucLuongResponse extends BaseEportalResponse {
  List<DanhSachMucLuongDataResponse> data;

  DanhSachMucLuongResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachMucLuongResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachMucLuongDataResponse> data = <DanhSachMucLuongDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachMucLuongDataResponse.fromJson(v));
      });
    }
    return DanhSachMucLuongResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
