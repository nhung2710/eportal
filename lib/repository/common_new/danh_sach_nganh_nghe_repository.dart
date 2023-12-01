import 'package:eportal/model/api/request/common_new/danh_sach_nganh_nghe_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_nganh_nghe_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachNganhNgheRepository extends BaseRepository<
    DanhSachNganhNgheRequest, DanhSachNganhNgheResponse> {
  @override
  DanhSachNganhNgheResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachNganhNgheResponse.fromJson(value);
}
