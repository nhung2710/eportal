import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuyen_muc_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_chuyen_muc_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChuyenMucRepository extends BaseRepository<
    DanhSachChuyenMucRequest, DanhSachChuyenMucResponse> {
  @override
  DanhSachChuyenMucResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachChuyenMucResponse.fromJson(value);
}
