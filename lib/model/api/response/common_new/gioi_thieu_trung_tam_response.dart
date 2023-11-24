import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GioiThieuTrungTamResponse extends BaseSingleEportalResponse<String> {
  GioiThieuTrungTamResponse(
      {required super.data, required super.status, required super.message});

  factory GioiThieuTrungTamResponse.fromJson(Map<String, dynamic> json) {
    return GioiThieuTrungTamResponse(
        data: json["data"], status: json["status"], message: json["message"]);
  }
}
