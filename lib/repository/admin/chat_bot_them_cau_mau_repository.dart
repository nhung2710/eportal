//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/request/admin/chat_bot_them_cau_mau_request.dart';
import 'package:eportal/model/api/response/admin/chat_bot_them_cau_mau_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class ChatBotThemCauMauRepository extends BaseRepository<
    ChatBotThemCauMauRequest, ChatBotThemCauMauResponse> {
  @override
  ChatBotThemCauMauResponse mapJsonToObject(Map<String, dynamic> value) =>
      ChatBotThemCauMauResponse.fromJson(value);
}
