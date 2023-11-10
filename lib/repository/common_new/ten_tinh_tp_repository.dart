//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/ten_tinh_tp_request.dart';
import 'package:eportal/model/api/response/common_new/ten_tinh_tp_response.dart';

class TenTinhTpRepository {

  Future<TenTinhTpResponse> getTenTinhTp(TenTinhTpRequest request) {
    return BaseAdapterApi().callApiAsync(request)
        .then((value) => TenTinhTpResponse.fromJson(value));
  }
}