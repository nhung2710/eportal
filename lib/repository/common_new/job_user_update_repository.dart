import 'package:eportal/model/api/request/common_new/job_user_update_request.dart';
import 'package:eportal/model/api/response/common_new/job_user_update_response.dart';
import 'package:eportal/repository/base/base_repository.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserUpdateRepository
    extends BaseRepository<JobUserUpdateRequest, JobUserUpdateResponse> {
  @override
  JobUserUpdateResponse mapJsonToObject(Map<String, dynamic> value) =>
      JobUserUpdateResponse.fromJson(value);
}
