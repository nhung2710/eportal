//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/home_document_list_data_response.dart';

class HomeDocumentListResponse extends BaseEportalResponse {
  List<HomeDocumentListDataResponse>? data;

  HomeDocumentListResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeDocumentListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeDocumentListDataResponse> data = <HomeDocumentListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeDocumentListDataResponse.fromJson(v));
      });
    }
    return HomeDocumentListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
