import 'package:eportal/model/api/request/admin/profile_save_request.dart';
import 'package:eportal/model/api/response/admin/profile_save_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileSaveRepository
    extends BaseRepository<ProfileSaveRequest, ProfileSaveResponse> {
  @override
  ProfileSaveResponse mapJsonToObject(Map<String, dynamic> value) =>
      ProfileSaveResponse.fromJson(value);
}
