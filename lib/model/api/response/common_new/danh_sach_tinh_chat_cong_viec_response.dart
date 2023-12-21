import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_chat_cong_viec_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachTinhChatCongViecResponse
    extends BaseMultiEportalResponse<DanhSachTinhChatCongViecDataResponse> {
  DanhSachTinhChatCongViecResponse(
      {required super.data, required super.status, required super.message});

  factory DanhSachTinhChatCongViecResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachTinhChatCongViecResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DanhSachTinhChatCongViecDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
