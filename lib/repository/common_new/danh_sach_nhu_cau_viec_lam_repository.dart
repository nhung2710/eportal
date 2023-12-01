import 'package:eportal/model/api/request/common_new/danh_sach_nhu_cau_viec_lam_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_nhu_cau_viec_lam_response.dart';
import 'package:eportal/repository/base/base_repository.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachNhuCauViecLamRepository extends BaseRepository<
    DanhSachNhuCauViecLamRequest, DanhSachNhuCauViecLamResponse> {
  @override
  DanhSachNhuCauViecLamResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachNhuCauViecLamResponse.fromJson(value);
}
