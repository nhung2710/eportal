import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/home_works_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_news_list_response.dart';
import 'package:eportal/model/api/response/common_new/home_works_list_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomeWorksListState extends BaseLoaded<HomeNewsListResponse> {
  const HomeWorksListState(super.data);

}