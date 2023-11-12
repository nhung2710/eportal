//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_trinh_do_request.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_trinh_do_response.dart';

class DanhSachTrinhDoRepository {
  Future<DanhSachTrinhDoResponse> getDanhSachTrinhDo(
      DanhSachTrinhDoRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DanhSachTrinhDoResponse.fromJson(value));
  }
}
