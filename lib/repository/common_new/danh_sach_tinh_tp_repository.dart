//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_tinh_tp_response.dart';

class DanhSachTinhTpRepository {

  Future<DanhSachTinhTpResponse> getDanhSachTinhTp(DanhSachTinhTpRequest request) {
    return BaseAdapterApi().callApiAsync(request)
        .then((value) => DanhSachTinhTpResponse.fromJson(value));
  }
}