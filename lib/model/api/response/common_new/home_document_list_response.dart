//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import 'data/common_new_data.dart';
import 'data/home_document_list_data.dart';

class HomeDocumentListResponse extends BaseEportalResponse {
  List<HomeDocumentListData>? data;

  HomeDocumentListResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory HomeDocumentListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeDocumentListData> data = <HomeDocumentListData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeDocumentListData.fromJson(v));
      });
    }
    return HomeDocumentListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
