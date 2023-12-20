//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/chat_bot_them_cau_mau_request.dart';

class ChatBotThemCauMauEvent extends BaseSingleEvent<ChatBotThemCauMauRequest> {
  const ChatBotThemCauMauEvent({required super.request});
}