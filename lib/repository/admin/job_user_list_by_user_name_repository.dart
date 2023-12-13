import 'package:eportal/model/api/request/admin/job_user_list_by_user_name_request.dart';
import 'package:eportal/model/api/response/admin/job_user_list_by_user_name_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserListByUserNameRepository extends BaseRepository<
    JobUserListByUserNameRequest, JobUserListByUserNameResponse> {
  @override
  JobUserListByUserNameResponse mapJsonToObject(Map<String, dynamic> value) =>
      JobUserListByUserNameResponse.fromJson(value);
}
