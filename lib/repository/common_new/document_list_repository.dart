import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/document_list_request.dart';
import 'package:eportal/model/api/response/common_new/document_list_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DocumentListRepository {
  Future<DocumentListResponse> getDocumentList(DocumentListRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DocumentListResponse.fromJson(value));
  }
}
