
//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../model/api/request/common_new/job_user_detail_request.dart';
import '../base/base_event.dart';

class JobUserDetailEvent extends BaseEvent<JobUserDetailRequest> {
  const JobUserDetailEvent({required super.request});
}
