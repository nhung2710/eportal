import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangNhapResponse extends BaseEportalResponse {
  List<DangNhapDataResponse>? data;

  DangNhapResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DangNhapResponse.fromJson(Map<String, dynamic> json) {
    List<DangNhapDataResponse> data = <DangNhapDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DangNhapDataResponse.fromJson(v));
      });
    }
    return DangNhapResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
