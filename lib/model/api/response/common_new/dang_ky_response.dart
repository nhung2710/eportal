import 'package:eportal/model/api/response/common_new/data/dang_ky_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangKyResponse extends BaseEportalResponse {
  List<DangKyDataResponse>? data;

  DangKyResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory DangKyResponse.fromJson(Map<String, dynamic> json) {
    List<DangKyDataResponse> data = <DangKyDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DangKyDataResponse.fromJson(v));
      });
    }
    return DangKyResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
