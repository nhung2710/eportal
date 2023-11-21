import 'package:eportal/model/api/response/common_new/data/danh_sach_co_quan_ban_hanh_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachCoQuanBanHanhResponse extends BaseEportalResponse {
  List<DanhSachCoQuanBanHanhDataResponse>? data;

  DanhSachCoQuanBanHanhResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachCoQuanBanHanhResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachCoQuanBanHanhDataResponse> data =
        <DanhSachCoQuanBanHanhDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachCoQuanBanHanhDataResponse.fromJson(v));
      });
    }
    return DanhSachCoQuanBanHanhResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
