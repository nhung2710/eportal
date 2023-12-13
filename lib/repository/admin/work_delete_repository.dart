import 'package:eportal/model/api/request/admin/work_delete_request.dart';
import 'package:eportal/model/api/response/admin/work_delete_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkDeleteRepository
    extends BaseRepository<WorkDeleteRequest, WorkDeleteResponse> {
  @override
  WorkDeleteResponse mapJsonToObject(Map<String, dynamic> value) =>
      WorkDeleteResponse.fromJson(value);
}
