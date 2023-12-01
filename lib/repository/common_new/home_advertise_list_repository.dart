import 'package:eportal/model/api/request/common_new/home_advertise_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_advertise_list_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListRepository extends BaseRepository<
    HomeAdvertiseListRequest, HomeAdvertiseListResponse> {
  @override
  HomeAdvertiseListResponse mapJsonToObject(Map<String, dynamic> value) =>
      HomeAdvertiseListResponse.fromJson(value);
}
