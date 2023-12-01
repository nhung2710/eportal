import 'package:eportal/model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_doanh_nghiep_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachDoanhNghiepRepository extends BaseRepository<
    DanhSachDoanhNghiepRequest, DanhSachDoanhNghiepResponse> {
  @override
  DanhSachDoanhNghiepResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachDoanhNghiepResponse.fromJson(value);
}
