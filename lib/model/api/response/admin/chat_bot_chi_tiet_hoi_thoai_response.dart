//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/chat_bot_chi_tiet_hoi_thoai_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class ChatBotChiTietHoiThoaiResponse
    extends BaseSingleEportalResponse<ChatBotChiTietHoiThoaiDataResponse> {
  ChatBotChiTietHoiThoaiResponse(
      {required super.data, required super.status, required super.message});

  factory ChatBotChiTietHoiThoaiResponse.fromJson(Map<String, dynamic> json) {
    return ChatBotChiTietHoiThoaiResponse(
        data: json.toObjectJson(
            mapJson: (v) => ChatBotChiTietHoiThoaiDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}