//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/common_new/ten_tinh_tp_request.dart';
import 'package:eportal/model/api/response/common_new/ten_tinh_tp_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

class TenTinhTpRepository
    extends BaseRepository<TenTinhTpRequest, TenTinhTpResponse> {
  @override
  TenTinhTpResponse mapJsonToObject(Map<String, dynamic> value) =>
      TenTinhTpResponse.fromJson(value);
}
