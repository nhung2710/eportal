//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/admin/chat_bot_danh_dau_sao_request.dart';
import 'package:eportal/model/api/response/admin/chat_bot_danh_dau_sao_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class ChatBotDanhDauSaoRepository extends BaseRepository<
    ChatBotDanhDauSaoRequest, ChatBotDanhDauSaoResponse> {
  @override
  ChatBotDanhDauSaoResponse mapJsonToObject(Map<String, dynamic> value) =>
      ChatBotDanhDauSaoResponse.fromJson(value);
}
