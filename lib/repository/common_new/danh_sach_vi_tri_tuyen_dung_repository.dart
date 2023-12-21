import 'package:eportal/model/api/request/common_new/danh_sach_vi_tri_tuyen_dung_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_vi_tri_tuyen_dung_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachViTriTuyenDungRepository extends BaseRepository<
    DanhSachViTriTuyenDungRequest, DanhSachViTriTuyenDungResponse> {
  @override
  DanhSachViTriTuyenDungResponse mapJsonToObject(Map<String, dynamic> value) =>
      DanhSachViTriTuyenDungResponse.fromJson(value);
}
