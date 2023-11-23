import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:flutter/material.dart';

import 'data/home_advertise_list_data_request.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListRequest
    extends BaseEportalRequest<HomeAdvertiseListDataRequest> {
  HomeAdvertiseListRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_HOME_ADVERTISE_LIST;
}
