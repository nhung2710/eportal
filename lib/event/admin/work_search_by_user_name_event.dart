import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/work_search_by_user_name_request.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchByUserNameEvent
    extends BasePageEvent<WorkSearchByUserNameRequest> {
  const WorkSearchByUserNameEvent({required super.request});
}
