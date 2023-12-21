import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_chat_cong_viec_request.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachTinhChatCongViecEvent
    extends BaseMultiEvent<DanhSachTinhChatCongViecRequest> {
  const DanhSachTinhChatCongViecEvent({required super.request});
}
