
//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../model/api/request/common_new/danh_sach_trinh_do_request.dart';
import '../base/base_event.dart';

class DanhSachTrinhDoEvent extends BaseEvent<DanhSachTrinhDoRequest> {
  const DanhSachTrinhDoEvent({required super.request});
}
