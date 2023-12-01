import 'package:eportal/model/api/request/common_new/dang_ky_request.dart';
import 'package:eportal/model/api/response/common_new/dang_ky_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DangKyRepository extends BaseRepository<DangKyRequest, DangKyResponse> {
  @override
  DangKyResponse mapJsonToObject(Map<String, dynamic> value) =>
      DangKyResponse.fromJson(value);
}
