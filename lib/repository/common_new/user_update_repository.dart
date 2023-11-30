import 'package:eportal/model/api/request/common_new/user_update_request.dart';
import 'package:eportal/model/api/response/common_new/user_update_response.dart';
import 'package:eportal/repository/base/base_repository.dart';
import 'package:flutter/material.dart';

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
