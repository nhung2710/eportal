//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_tinh_tp_data_response.dart';

class DanhSachTinhTpResponse extends BaseEportalResponse {
  List<DanhSachTinhTpDataResponse>? data;

  DanhSachTinhTpResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachTinhTpResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachTinhTpDataResponse> data = <DanhSachTinhTpDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachTinhTpDataResponse.fromJson(v));
      });
    }
    return DanhSachTinhTpResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
