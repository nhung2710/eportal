import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuyen_muc_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_chuyen_muc_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChuyenMucRepository {
  Future<DanhSachChuyenMucResponse> getDanhSachChuyenMuc(
      DanhSachChuyenMucRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DanhSachChuyenMucResponse.fromJson(value));
  }
}
