import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/commonnew/home_works_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_works_list_response.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListCommonEvent extends BaseEvent {
  HomeWorksListRequest request;
  HomeWorksListCommonEvent({required this.request});
}

