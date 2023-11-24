//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import '../base/base_event.dart';

class DanhSachGioiTinhEvent extends BaseMultiEvent<DanhSachGioiTinhRequest> {
  const DanhSachGioiTinhEvent({required super.request});
}
