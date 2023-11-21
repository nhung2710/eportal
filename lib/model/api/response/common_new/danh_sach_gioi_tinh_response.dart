//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_gioi_tinh_data_response.dart';

class DanhSachGioiTinhResponse extends BaseEportalResponse {
  List<DanhSachGioiTinhDataResponse> data;

  DanhSachGioiTinhResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachGioiTinhResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachGioiTinhDataResponse> data = <DanhSachGioiTinhDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachGioiTinhDataResponse.fromJson(v));
      });
    }
    return DanhSachGioiTinhResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
