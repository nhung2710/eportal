//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/chat_bot_xoa_hoi_thoai_event.dart';
import 'package:eportal/model/api/response/admin/chat_bot_xoa_hoi_thoai_response.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_xoa_hoi_thoai_data_response.dart';
import 'package:eportal/repository/admin/chat_bot_xoa_hoi_thoai_repository.dart';

class ChatBotXoaHoiThoaiBloc extends BaseSingleBloc<
    String,
    ChatBotXoaHoiThoaiRepository,
    ChatBotXoaHoiThoaiEvent,
    ChatBotXoaHoiThoaiResponse> {
  @override
  Future<ChatBotXoaHoiThoaiResponse> callApiResult(
          ChatBotXoaHoiThoaiRepository apiRepository,
          ChatBotXoaHoiThoaiEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ChatBotXoaHoiThoaiResponse response) => null;

  @override
  ChatBotXoaHoiThoaiRepository getRepository() =>
      ChatBotXoaHoiThoaiRepository();
}
