import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/gioi_thieu_trung_tam_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GioiThieuTrungTamRequest
    extends BaseEportalRequest<GioiThieuTrungTamDataRequest> {
  GioiThieuTrungTamRequest({required super.obj});

  @override
  String getQuery() =>
      ApplicationApiConstant.kAPI_COMMON_NEW_OP_GIOI_THIEU_TRUNG_TAM;

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_DEFAULT;
}
