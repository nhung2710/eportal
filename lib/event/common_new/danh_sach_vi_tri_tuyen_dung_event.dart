import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_vi_tri_tuyen_dung_request.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachViTriTuyenDungEvent
    extends BaseMultiEvent<DanhSachViTriTuyenDungRequest> {
  const DanhSachViTriTuyenDungEvent({required super.request});
}
