//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_muc_luong_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class DanhSachMucLuongRepository
    extends BaseRepository<DanhSachMucLuongRequest, DanhSachMucLuongResponse> {
  @override
  DanhSachMucLuongResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachMucLuongResponse.fromJson(value);
}
