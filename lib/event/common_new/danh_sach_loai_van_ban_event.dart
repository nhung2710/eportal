import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_loai_van_ban_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachLoaiVanBanEvent
    extends BaseMultiEvent<DanhSachLoaiVanBanRequest> {
  const DanhSachLoaiVanBanEvent({required super.request});
}
