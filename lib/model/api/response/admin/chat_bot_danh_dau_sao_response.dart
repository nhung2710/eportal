//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/chat_bot_danh_dau_sao_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class ChatBotDanhDauSaoResponse
    extends BaseSingleEportalResponse<ChatBotDanhDauSaoDataResponse> {
  ChatBotDanhDauSaoResponse(
      {required super.data, required super.status, required super.message});

  factory ChatBotDanhDauSaoResponse.fromJson(Map<String, dynamic> json) {
    return ChatBotDanhDauSaoResponse(
        data: json.toObjectJson(
            mapJson: (v) => ChatBotDanhDauSaoDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}