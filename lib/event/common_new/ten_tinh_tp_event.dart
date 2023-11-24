//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../model/api/request/common_new/ten_tinh_tp_request.dart';
import '../base/base_event.dart';

class TenTinhTpEvent extends BaseSingleEvent<TenTinhTpRequest> {
  const TenTinhTpEvent({required super.request});
}
