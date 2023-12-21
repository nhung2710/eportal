//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/admin/data/chat_bot_them_cau_mau_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class ChatBotThemCauMauRequest
    extends BaseEportalRequest<ChatBotThemCauMauDataRequest> {
  ChatBotThemCauMauRequest({required super.obj});

  @override
  String getQuery() =>
      ApplicationApiConstant.kAPI_ADMIN_OP_CHAT_BOT_THEM_CAU_MAU;

  @override
  bool isAuthentication() => true;

  @override
  String getBaseUri() => ApplicationApiConstant.kAPI_ADMIN_OP;
}
