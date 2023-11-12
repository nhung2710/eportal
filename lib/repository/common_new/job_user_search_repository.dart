//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/job_user_search_request.dart';
import 'package:eportal/model/api/response/common_new/job_user_search_response.dart';

class JobUserSearchRepository {
  Future<JobUserSearchResponse> getJobUserSearch(JobUserSearchRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => JobUserSearchResponse.fromJson(value));
  }
}
