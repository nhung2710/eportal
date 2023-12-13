import 'package:eportal/model/api/request/admin/work_add_request.dart';
import 'package:eportal/model/api/response/admin/work_add_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkAddRepository
    extends BaseRepository<WorkAddRequest, WorkAddResponse> {
  @override
  WorkAddResponse mapJsonToObject(Map<String, dynamic> value) =>
      WorkAddResponse.fromJson(value);
}
