import 'package:eportal/model/api/request/common_new/gioi_thieu_trung_tam_request.dart';
import 'package:eportal/model/api/response/common_new/gioi_thieu_trung_tam_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GioiThieuTrungTamRepository extends BaseRepository<
    GioiThieuTrungTamRequest, GioiThieuTrungTamResponse> {
  @override
  GioiThieuTrungTamResponse mapJsonToObject(Map<String, dynamic> value) =>
      GioiThieuTrungTamResponse.fromJson(value);
}
