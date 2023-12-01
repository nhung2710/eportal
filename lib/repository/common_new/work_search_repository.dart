//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/common_new/work_search_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class WorkSearchRepository
    extends BaseRepository<WorkSearchRequest, WorkSearchResponse> {
  @override
  WorkSearchResponse mapJsonToObject(Map<String, dynamic> value) =>
      WorkSearchResponse.fromJson(value);
}
