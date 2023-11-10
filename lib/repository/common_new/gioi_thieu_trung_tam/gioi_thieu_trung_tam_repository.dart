import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/gioi_thieu_trung_tam_request.dart';
import 'package:eportal/model/api/response/common_new/gioi_thieu_trung_tam_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GioiThieuTrungTamRepository {

  Future<GioiThieuTrungTamResponse> getGioiThieuTrungTam(GioiThieuTrungTamRequest request) {
    return BaseAdapterApi().callApiAsync(request)
        .then((value) => GioiThieuTrungTamResponse.fromJson(value));
  }
}