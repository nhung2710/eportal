import '../../model/api/request/common_new/home_slide_list_request.dart';
import '../base/base_event.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeSlideListEvent extends BaseMultiEvent<HomeSlideListRequest> {
  const HomeSlideListEvent({required super.request});
}
