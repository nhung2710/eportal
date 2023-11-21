import 'package:eportal/model/api/response/common_new/data/document_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DocumentListResponse extends BaseEportalResponse {
  List<DocumentListDataResponse> data;

  DocumentListResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory DocumentListResponse.fromJson(Map<String, dynamic> json) {
    List<DocumentListDataResponse> data = <DocumentListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DocumentListDataResponse.fromJson(v));
      });
    }
    return DocumentListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
