import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/user_update_request.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class UserUpdateEvent extends BaseSingleEvent<UserUpdateRequest> {
  const UserUpdateEvent({required super.request});
}
