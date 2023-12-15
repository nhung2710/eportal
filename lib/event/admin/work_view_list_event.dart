import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/work_view_list_request.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkViewListEvent extends BasePageEvent<WorkViewListRequest> {
  const WorkViewListEvent({required super.request});
}
