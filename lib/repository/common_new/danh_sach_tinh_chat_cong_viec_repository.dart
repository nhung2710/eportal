import 'package:eportal/model/api/request/common_new/danh_sach_tinh_chat_cong_viec_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_tinh_chat_cong_viec_response.dart';
import 'package:eportal/repository/base/base_repository.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachTinhChatCongViecRepository extends BaseRepository<
    DanhSachTinhChatCongViecRequest, DanhSachTinhChatCongViecResponse> {
  @override
  DanhSachTinhChatCongViecResponse mapJsonToObject(
          Map<String, dynamic> value) =>
      DanhSachTinhChatCongViecResponse.fromJson(value);
}
