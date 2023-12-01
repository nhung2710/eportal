//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/common_new/home_job_user_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_job_user_list_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class HomeJobUserListRepository
    extends BaseRepository<HomeJobUserListRequest, HomeJobUserListResponse> {
  @override
  HomeJobUserListResponse mapJsonToObject(Map<String, dynamic> value) =>
      HomeJobUserListResponse.fromJson(value);
}
