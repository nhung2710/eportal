import 'package:eportal/model/api/request/common_new/job_user_add_request.dart';
import 'package:eportal/model/api/response/common_new/job_user_add_response.dart';
import 'package:eportal/repository/base/base_repository.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserAddRepository
    extends BaseRepository<JobUserAddRequest, JobUserAddResponse> {
  @override
  JobUserAddResponse mapJsonToObject(Map<String, dynamic> value) =>
      JobUserAddResponse.fromJson(value);
}
