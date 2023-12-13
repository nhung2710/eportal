import 'package:eportal/model/api/request/admin/work_search_by_user_name_request.dart';
import 'package:eportal/model/api/response/admin/work_search_by_user_name_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchByUserNameRepository extends BaseRepository<
    WorkSearchByUserNameRequest, WorkSearchByUserNameResponse> {
  @override
  WorkSearchByUserNameResponse mapJsonToObject(Map<String, dynamic> value) =>
      WorkSearchByUserNameResponse.fromJson(value);
}
