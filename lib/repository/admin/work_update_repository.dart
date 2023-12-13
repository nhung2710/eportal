import 'package:eportal/model/api/request/admin/work_update_request.dart';
import 'package:eportal/model/api/response/admin/work_update_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkUpdateRepository
    extends BaseRepository<WorkUpdateRequest, WorkUpdateResponse> {
  @override
  WorkUpdateResponse mapJsonToObject(Map<String, dynamic> value) =>
      WorkUpdateResponse.fromJson(value);
}
