//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_muc_luong_response.dart';

class DanhSachMucLuongRepository {
  Future<DanhSachMucLuongResponse> getDanhSachMucLuong(
      DanhSachMucLuongRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DanhSachMucLuongResponse.fromJson(value));
  }
}
