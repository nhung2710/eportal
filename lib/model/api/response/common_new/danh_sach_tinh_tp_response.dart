//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_tinh_tp_data.dart';

class DanhSachTinhTpResponse extends BaseEportalResponse {
  List<DanhSachTinhTpData>? data;

  DanhSachTinhTpResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachTinhTpResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachTinhTpData> data = <DanhSachTinhTpData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachTinhTpData.fromJson(v));
      });
    }
    return DanhSachTinhTpResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
