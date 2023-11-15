//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_kinh_nghiem_data_response.dart';

class DanhSachKinhNghiemResponse extends BaseEportalResponse {
  List<DanhSachKinhNghiemDataResponse>? data;

  DanhSachKinhNghiemResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachKinhNghiemResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachKinhNghiemDataResponse> data =
        <DanhSachKinhNghiemDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachKinhNghiemDataResponse.fromJson(v));
      });
    }
    return DanhSachKinhNghiemResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
