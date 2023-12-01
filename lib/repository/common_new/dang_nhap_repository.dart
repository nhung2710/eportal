import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/response/common_new/dang_nhap_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangNhapRepository
    extends BaseRepository<DangNhapRequest, DangNhapResponse> {
  @override
  DangNhapResponse mapJsonToObject(Map<String, dynamic> value) =>
      DangNhapResponse.fromJson(value);
}
