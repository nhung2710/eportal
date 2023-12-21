//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/chat_bot_xoa_hoi_thoai_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class ChatBotXoaHoiThoaiResponse
    extends BaseSingleEportalResponse<String> {
  ChatBotXoaHoiThoaiResponse(
      {required super.data, required super.status, required super.message});

  factory ChatBotXoaHoiThoaiResponse.fromJson(Map<String, dynamic> json) {
    return ChatBotXoaHoiThoaiResponse(
        data: json.toStringJson(),
        status: json["status"],
        message: json["message"]);
  }
}
