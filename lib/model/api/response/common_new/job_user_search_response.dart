//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'dart:convert';

import 'package:eportal/model/api/response/common_new/data/job_user_search_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

class JobUserSearchResponse extends BaseEportalResponse {
  List<JobUserSearchDataResponse> data;

  JobUserSearchResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory JobUserSearchResponse.fromJson(Map<String, dynamic> json) {
    List<JobUserSearchDataResponse> data = <JobUserSearchDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(JobUserSearchDataResponse.fromJson(v));
      });
    }
    return JobUserSearchResponse(
        data: data, status: json["status"], message: json["message"]);
  }

  @override
  String toString() {
    return json.encode(data);
  }
}
