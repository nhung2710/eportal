import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/dang_ky_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DangKyEvent extends BaseEvent<DangKyRequest> {
  const DangKyEvent({required super.request});
}
