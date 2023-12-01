import 'package:eportal/model/api/request/common_new/danh_sach_co_quan_ban_hanh_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_co_quan_ban_hanh_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachCoQuanBanHanhRepository extends BaseRepository<
    DanhSachCoQuanBanHanhRequest, DanhSachCoQuanBanHanhResponse> {
  @override
  DanhSachCoQuanBanHanhResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachCoQuanBanHanhResponse.fromJson(value);
}
