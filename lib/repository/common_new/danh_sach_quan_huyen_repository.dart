//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_quan_huyen_response.dart';

class DanhSachQuanHuyenRepository {
  Future<DanhSachQuanHuyenResponse> getDanhSachQuanHuyen(
      DanhSachQuanHuyenRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DanhSachQuanHuyenResponse.fromJson(value));
  }
}
