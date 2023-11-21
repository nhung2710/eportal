//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/danh_sach_doanh_nghiep_data_response.dart';

class DanhSachDoanhNghiepResponse extends BaseEportalResponse {
  List<DanhSachDoanhNghiepDataResponse> data;

  DanhSachDoanhNghiepResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachDoanhNghiepResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachDoanhNghiepDataResponse> data =
        <DanhSachDoanhNghiepDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachDoanhNghiepDataResponse.fromJson(v));
      });
    }
    return DanhSachDoanhNghiepResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
