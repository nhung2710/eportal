import 'package:eportal/model/api/request/admin/profile_view_list_request.dart';
import 'package:eportal/model/api/response/admin/profile_view_list_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ProfileViewListRepository
    extends BaseRepository<ProfileViewListRequest, ProfileViewListResponse> {
  @override
  ProfileViewListResponse mapJsonToObject(Map<String, dynamic> value) =>
      ProfileViewListResponse.fromJson(value);
}
