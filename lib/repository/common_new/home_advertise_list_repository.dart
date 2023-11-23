import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/home_advertise_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_advertise_list_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListRepository {
  Future<HomeAdvertiseListResponse> getHomeAdvertiseList(
      HomeAdvertiseListRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => HomeAdvertiseListResponse.fromJson(value));
  }
}
