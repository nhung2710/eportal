//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/home_business_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_business_list_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class HomeBusinessListRepository
    extends BaseRepository<HomeBusinessListRequest, HomeBusinessListResponse> {
  @override
  HomeBusinessListResponse mapJsonToObject(Map<String, dynamic> value) =>
      HomeBusinessListResponse.fromJson(value);
}
