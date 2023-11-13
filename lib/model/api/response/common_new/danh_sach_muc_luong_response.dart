//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_muc_luong_data.dart';

class DanhSachMucLuongResponse extends BaseEportalResponse {
  List<DanhSachMucLuongData>? data;

  DanhSachMucLuongResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachMucLuongResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachMucLuongData> data = <DanhSachMucLuongData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachMucLuongData.fromJson(v));
      });
    }
    return DanhSachMucLuongResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
