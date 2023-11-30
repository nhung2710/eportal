import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_linh_vuc_van_ban_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_linh_vuc_van_ban_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachLinhVucVanBanRepository extends BaseRepository<
    DanhSachLinhVucVanBanRequest, DanhSachLinhVucVanBanResponse> {
  @override
  DanhSachLinhVucVanBanResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachLinhVucVanBanResponse.fromJson(value);
}
