//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/chat_bot_danh_dau_sao_request.dart';

class ChatBotDanhDauSaoEvent extends BaseSingleEvent<ChatBotDanhDauSaoRequest> {
  const ChatBotDanhDauSaoEvent({required super.request});
}
