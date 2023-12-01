import 'package:eportal/model/api/request/common_new/document_list_request.dart';
import 'package:eportal/model/api/response/common_new/document_list_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DocumentListRepository
    extends BaseRepository<DocumentListRequest, DocumentListResponse> {
  @override
  DocumentListResponse mapJsonToObject(Map<String, dynamic> value) =>
      DocumentListResponse.fromJson(value);
}
