import 'package:eportal/model/api/response/common_new/data/danh_sach_loai_van_ban_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachLoaiVanBanResponse extends BaseEportalResponse {
  List<DanhSachLoaiVanBanDataResponse> data;

  DanhSachLoaiVanBanResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory DanhSachLoaiVanBanResponse.fromJson(Map<String, dynamic> json) {
    List<DanhSachLoaiVanBanDataResponse> data =
        <DanhSachLoaiVanBanDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DanhSachLoaiVanBanDataResponse.fromJson(v));
      });
    }
    return DanhSachLoaiVanBanResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
