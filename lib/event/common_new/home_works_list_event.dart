import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/home_works_list_request.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListEvent extends BaseMultiEvent<HomeWorksListRequest> {
  const HomeWorksListEvent({required super.request});
}
