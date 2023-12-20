//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/chat_bot_them_cau_mau_event.dart';
import 'package:eportal/model/api/response/admin/chat_bot_them_cau_mau_response.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_them_cau_mau_data_response.dart';
import 'package:eportal/repository/admin/chat_bot_them_cau_mau_repository.dart';

class ChatBotThemCauMauBloc extends BaseSingleBloc<ChatBotThemCauMauDataResponse,
    ChatBotThemCauMauRepository, ChatBotThemCauMauEvent, ChatBotThemCauMauResponse> {
  @override
  Future<ChatBotThemCauMauResponse> callApiResult(
      ChatBotThemCauMauRepository apiRepository, ChatBotThemCauMauEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ChatBotThemCauMauResponse response) => null;

  @override
  ChatBotThemCauMauRepository getRepository() => ChatBotThemCauMauRepository();
}