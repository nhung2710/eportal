import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_delete_request.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferDeleteEvent
    extends BaseSingleEvent<JobUserReferDeleteRequest> {
  const JobUserReferDeleteEvent({required super.request});
}
