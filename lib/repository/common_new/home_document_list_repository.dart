//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/home_document_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_document_list_response.dart';

class HomeDocumentListRepository {
  Future<HomeDocumentListResponse> getHomeDocumentList(
      HomeDocumentListRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => HomeDocumentListResponse.fromJson(value));
  }
}
