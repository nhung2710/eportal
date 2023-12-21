//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/chat_bot_danh_dau_sao_event.dart';
import 'package:eportal/model/api/response/admin/chat_bot_danh_dau_sao_response.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_danh_dau_sao_data_response.dart';
import 'package:eportal/repository/admin/chat_bot_danh_dau_sao_repository.dart';

class ChatBotDanhDauSaoBloc extends BaseSingleBloc<
    String,
    ChatBotDanhDauSaoRepository,
    ChatBotDanhDauSaoEvent,
    ChatBotDanhDauSaoResponse> {
  @override
  Future<ChatBotDanhDauSaoResponse> callApiResult(
          ChatBotDanhDauSaoRepository apiRepository,
          ChatBotDanhDauSaoEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ChatBotDanhDauSaoResponse response) => null;

  @override
  ChatBotDanhDauSaoRepository getRepository() => ChatBotDanhDauSaoRepository();
}
