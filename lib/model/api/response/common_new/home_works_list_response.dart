import 'package:eportal/model/api/response/common_new/data/common_new_data.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListResponse extends BaseEportalResponse {
  List<CommonNewData>? data;

  HomeWorksListResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeWorksListResponse.fromJson(Map<String, dynamic> json) {
    List<CommonNewData> data = <CommonNewData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(CommonNewData.fromJson(v));
      });
    }
    return HomeWorksListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
