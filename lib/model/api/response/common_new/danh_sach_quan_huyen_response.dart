//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_quan_huyen_data.dart';

class DanhSachQuanHuyenResponse extends BaseEportalResponse {
  List<DanhSachQuanHuyenData>? data;

  DanhSachQuanHuyenResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachQuanHuyenResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachQuanHuyenData> data = <DanhSachQuanHuyenData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachQuanHuyenData.fromJson(v));
      });
    }
    return DanhSachQuanHuyenResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
