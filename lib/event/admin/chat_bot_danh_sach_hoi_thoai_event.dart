//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/chat_bot_danh_sach_hoi_thoai_request.dart';

class ChatBotDanhSachHoiThoaiEvent extends BasePageEvent<ChatBotDanhSachHoiThoaiRequest> {
  const ChatBotDanhSachHoiThoaiEvent({required super.request});
}