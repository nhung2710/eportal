//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/chat_bot_chi_tiet_hoi_thoai_request.dart';

class ChatBotChiTietHoiThoaiEvent
    extends BaseMultiEvent<ChatBotChiTietHoiThoaiRequest> {
  const ChatBotChiTietHoiThoaiEvent({required super.request});
}
