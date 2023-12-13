import 'package:eportal/model/api/request/admin/work_save_list_request.dart';
import 'package:eportal/model/api/response/admin/work_save_list_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSaveListRepository
    extends BaseRepository<WorkSaveListRequest, WorkSaveListResponse> {
  @override
  WorkSaveListResponse mapJsonToObject(Map<String, dynamic> value) =>
      WorkSaveListResponse.fromJson(value);
}
