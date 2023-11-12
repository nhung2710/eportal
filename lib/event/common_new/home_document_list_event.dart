
//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../model/api/request/common_new/home_document_list_request.dart';
import '../base/base_event.dart';

class HomeDocumentListEvent extends BaseEvent<HomeDocumentListRequest> {
  const HomeDocumentListEvent({required super.request});
}
