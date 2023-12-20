//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/chat_bot_chi_tiet_hoi_thoai_event.dart';
import 'package:eportal/model/api/response/admin/chat_bot_chi_tiet_hoi_thoai_response.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_chi_tiet_hoi_thoai_data_response.dart';
import 'package:eportal/repository/admin/chat_bot_chi_tiet_hoi_thoai_repository.dart';

class ChatBotChiTietHoiThoaiBloc extends BaseSingleBloc<ChatBotChiTietHoiThoaiDataResponse,
    ChatBotChiTietHoiThoaiRepository, ChatBotChiTietHoiThoaiEvent, ChatBotChiTietHoiThoaiResponse> {
  @override
  Future<ChatBotChiTietHoiThoaiResponse> callApiResult(
      ChatBotChiTietHoiThoaiRepository apiRepository, ChatBotChiTietHoiThoaiEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ChatBotChiTietHoiThoaiResponse response) => null;

  @override
  ChatBotChiTietHoiThoaiRepository getRepository() => ChatBotChiTietHoiThoaiRepository();
}