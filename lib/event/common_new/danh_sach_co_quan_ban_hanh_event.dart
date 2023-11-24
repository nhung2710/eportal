import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_co_quan_ban_hanh_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachCoQuanBanHanhEvent
    extends BaseMultiEvent<DanhSachCoQuanBanHanhRequest> {
  const DanhSachCoQuanBanHanhEvent({required super.request});
}
