import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/home_advertise_list_request.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListEvent extends BaseMultiEvent<HomeAdvertiseListRequest> {
  const HomeAdvertiseListEvent({required super.request});
}
