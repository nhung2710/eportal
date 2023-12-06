import 'package:eportal/model/api/request/admin/user_update_request.dart';
import 'package:eportal/model/api/response/admin/user_update_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class UserUpdateRepository
    extends BaseRepository<UserUpdateRequest, UserUpdateResponse> {
  @override
  UserUpdateResponse mapJsonToObject(Map<String, dynamic> value) =>
      UserUpdateResponse.fromJson(value);
}
