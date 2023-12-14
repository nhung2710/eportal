import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_chat_cong_viec_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachTinhChatCongViecRequest
    extends BaseEportalRequest<DanhSachTinhChatCongViecDataRequest> {
  DanhSachTinhChatCongViecRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.kAPI_COMMON_NEW_OP_DANH_SACH_TINH_CHAT_CONG_VIEC;
}
