//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'dart:convert';

import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

class WorkSearchResponse
    extends BasePageEportalResponse<WorkSearchDataResponse> {
  WorkSearchResponse(
      {required super.data, required super.status, required super.message});

  factory WorkSearchResponse.fromJson(Map<String, dynamic> json) {
    List<WorkSearchDataResponse> data = <WorkSearchDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(WorkSearchDataResponse.fromJson(v));
      });
    }
    return WorkSearchResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
