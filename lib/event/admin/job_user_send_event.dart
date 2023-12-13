import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/job_user_send_request.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserSendEvent extends BaseSingleEvent<JobUserSendRequest> {
  const JobUserSendEvent({required super.request});
}
