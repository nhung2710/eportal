import 'package:eportal/model/api/request/admin/job_user_refer_update_request.dart';
import 'package:eportal/model/api/response/admin/job_user_refer_update_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserReferUpdateRepository extends BaseRepository<
    JobUserReferUpdateRequest, JobUserReferUpdateResponse> {
  @override
  JobUserReferUpdateResponse mapJsonToObject(Map<String, dynamic> value) =>
      JobUserReferUpdateResponse.fromJson(value);
}
