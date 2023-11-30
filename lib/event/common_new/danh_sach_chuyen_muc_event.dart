import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuyen_muc_request.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachChuyenMucEvent extends BaseMultiEvent<DanhSachChuyenMucRequest> {
  const DanhSachChuyenMucEvent({required super.request});
}
