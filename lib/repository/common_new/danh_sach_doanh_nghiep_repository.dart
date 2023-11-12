import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_doanh_nghiep_response.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachDoanhNghiepRepository {
  Future<DanhSachDoanhNghiepResponse> getDanhSachDoanhNghiep(
      DanhSachDoanhNghiepRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DanhSachDoanhNghiepResponse.fromJson(value));
  }
}
