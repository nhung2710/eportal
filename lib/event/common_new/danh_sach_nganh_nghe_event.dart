import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nganh_nghe_request.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachNganhNgheEvent extends BaseMultiEvent<DanhSachNganhNgheRequest> {
  const DanhSachNganhNgheEvent({required super.request});
}
