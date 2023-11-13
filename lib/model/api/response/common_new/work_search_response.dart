//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'dart:convert';

import 'package:eportal/model/api/response/common_new/data/work_search_data.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

class WorkSearchResponse extends BaseEportalResponse {
  List<WorkSearchData>? data;

  WorkSearchResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory WorkSearchResponse.fromJson(Map<String, dynamic> json) {
    List<WorkSearchData> data = <WorkSearchData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(WorkSearchData.fromJson(v));
      });
    }
    return WorkSearchResponse(
        data: data, status: json["status"], message: json["message"]);
  }

  @override
  String toString() {
    return json.encode(data);
  }
}
