//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_tinh_tp_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class DanhSachTinhTpRepository
    extends BaseRepository<DanhSachTinhTpRequest, DanhSachTinhTpResponse> {
  @override
  DanhSachTinhTpResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachTinhTpResponse.fromJson(value);
}
