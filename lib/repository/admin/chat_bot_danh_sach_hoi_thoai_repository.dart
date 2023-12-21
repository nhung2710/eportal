//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/request/admin/chat_bot_danh_sach_hoi_thoai_request.dart';
import 'package:eportal/model/api/response/admin/chat_bot_danh_sach_hoi_thoai_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class ChatBotDanhSachHoiThoaiRepository extends BaseRepository<
    ChatBotDanhSachHoiThoaiRequest, ChatBotDanhSachHoiThoaiResponse> {
  @override
  ChatBotDanhSachHoiThoaiResponse mapJsonToObject(Map<String, dynamic> value) =>
      ChatBotDanhSachHoiThoaiResponse.fromJson(value);
}
