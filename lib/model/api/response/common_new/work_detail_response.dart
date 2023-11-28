//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/common_new/data/work_detail_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

class WorkDetailResponse
    extends BaseSingleEportalResponse<WorkDetailDataResponse> {
  WorkDetailResponse(
      {required super.data, required super.status, required super.message});

  factory WorkDetailResponse.fromJson(Map<String, dynamic> json) {
    return WorkDetailResponse(
        data: json["data"] == null
            ? null
            : WorkDetailDataResponse.fromJson(json["data"]),
        status: json["status"],
        message: json["message"]);
  }
}
