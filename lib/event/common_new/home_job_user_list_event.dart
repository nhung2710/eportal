
//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../model/api/request/common_new/home_job_user_list_request.dart';
import '../base/base_event.dart';

class HomeJobUserListEvent extends BaseEvent<HomeJobUserListRequest> {
  const HomeJobUserListEvent({required super.request});
}
