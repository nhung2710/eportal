import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangNhapResponse extends BaseSingleEportalResponse<DangNhapDataResponse> {
  DangNhapResponse(
      {required super.data, required super.status, required super.message});

  factory DangNhapResponse.fromJson(Map<String, dynamic> json) {
    return DangNhapResponse(
        data: json["data"] == null
            ? null
            : DangNhapDataResponse.fromJson(json["data"]),
        status: json["status"],
        message: json["message"]);
  }
}
