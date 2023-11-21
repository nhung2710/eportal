import 'package:eportal/model/api/response/common_new/data/dang_ky_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangKyResponse extends BaseEportalResponse {
  DangKyDataResponse data;

  DangKyResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory DangKyResponse.fromJson(Map<String, dynamic> json) {
    List<DangKyDataResponse> data = <DangKyDataResponse>[];
    return DangKyResponse(
        data: DangKyDataResponse.fromJson(json['data']), status: json["status"], message: json["message"]);
  }
}
