//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../model/api/request/common_new/work_search_request.dart';
import '../base/base_event.dart';

class WorkSearchEvent extends BasePageEvent<WorkSearchRequest> {
  const WorkSearchEvent({required super.request});
}
