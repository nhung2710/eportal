import 'package:eportal/model/api/response/common_new/data/danh_sach_chuyen_muc_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChuyenMucResponse
    extends BaseMultiEportalResponse<DanhSachChuyenMucDataResponse> {
  DanhSachChuyenMucResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachChuyenMucResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachChuyenMucDataResponse> data =
        <DanhSachChuyenMucDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachChuyenMucDataResponse.fromJson(v));
      });
    }
    return DanhSachChuyenMucResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
