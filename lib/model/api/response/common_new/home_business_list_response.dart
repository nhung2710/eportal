//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

class HomeBusinessListResponse extends BaseEportalResponse {
  String? data;

  HomeBusinessListResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeBusinessListResponse.fromJson(Map<String, dynamic> json) {
    return HomeBusinessListResponse(
        data: json["data"], status: json["status"], message: json["message"]);
  }
}
