import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/response/common_new/dang_nhap_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangNhapRepository {
  Future<DangNhapResponse> getDangNhap(DangNhapRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => DangNhapResponse.fromJson(value));
  }
}
