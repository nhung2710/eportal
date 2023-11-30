import 'package:eportal/model/api/response/common_new/data/document_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DocumentListResponse
    extends BasePageEportalResponse<DocumentListDataResponse> {
  DocumentListResponse(
      {required super.data, required super.status, required super.message});

  factory DocumentListResponse.fromJson(Map<String, dynamic> json) {
    return DocumentListResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DocumentListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
