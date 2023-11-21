import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_loai_van_ban_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_loai_van_ban_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachLoaiVanBanRepository {
  Future<DanhSachLoaiVanBanResponse> getDanhSachLoaiVanBan(
      DanhSachLoaiVanBanRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DanhSachLoaiVanBanResponse.fromJson(value));
  }
}
