//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/home_document_list_data_response.dart';

class HomeDocumentListResponse
    extends BaseMultiEportalResponse<HomeDocumentListDataResponse> {
  HomeDocumentListResponse(
      {required super.data, required super.status, required super.message});

  factory HomeDocumentListResponse.fromJson(Map<String, dynamic> json) {
    return HomeDocumentListResponse(
        data: json.toListObjectJson(
            mapJson: (v) => HomeDocumentListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
