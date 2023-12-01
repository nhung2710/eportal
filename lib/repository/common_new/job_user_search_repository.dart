//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/common_new/job_user_search_request.dart';
import 'package:eportal/model/api/response/common_new/job_user_search_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class JobUserSearchRepository
    extends BaseRepository<JobUserSearchRequest, JobUserSearchResponse> {
  @override
  JobUserSearchResponse mapJsonToObject(Map<String, dynamic> value) =>
      JobUserSearchResponse.fromJson(value);
}
