import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nhu_cau_viec_lam_request.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachNhuCauViecLamEvent
    extends BaseMultiEvent<DanhSachNhuCauViecLamRequest> {
  const DanhSachNhuCauViecLamEvent({required super.request});
}
