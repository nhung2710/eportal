import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_co_quan_ban_hanh_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_co_quan_ban_hanh_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachCoQuanBanHanhRepository {
  Future<DanhSachCoQuanBanHanhResponse> getDanhSachCoQuanBanHanh(
      DanhSachCoQuanBanHanhRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DanhSachCoQuanBanHanhResponse.fromJson(value));
  }
}
