//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_gioi_tinh_data.dart';

class DanhSachGioiTinhResponse extends BaseEportalResponse {
  List<DanhSachGioiTinhData>? data;

  DanhSachGioiTinhResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachGioiTinhResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachGioiTinhData> data = <DanhSachGioiTinhData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachGioiTinhData.fromJson(v));
      });
    }
    return DanhSachGioiTinhResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
