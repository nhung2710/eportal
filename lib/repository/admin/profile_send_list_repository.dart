import 'package:eportal/model/api/request/admin/profile_send_list_request.dart';
import 'package:eportal/model/api/response/admin/profile_send_list_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileSendListRepository
    extends BaseRepository<ProfileSendListRequest, ProfileSendListResponse> {
  @override
  ProfileSendListResponse mapJsonToObject(Map<String, dynamic> value) =>
      ProfileSendListResponse.fromJson(value);
}
