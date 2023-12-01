import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuc_vu_request.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChucVuEvent extends BaseMultiEvent<DanhSachChucVuRequest> {
  const DanhSachChucVuEvent({required super.request});
}
