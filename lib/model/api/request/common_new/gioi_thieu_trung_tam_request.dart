import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GioiThieuTrungTamRequest extends BaseEportalRequest<CommonNewData> {
  GioiThieuTrungTamRequest({required super.obj});

  @override
  String getQuery()  => ApplicationApiConstant.API_OP_GIOI_THIEU_TRUNG_TAM_LIST;
  @override
  int getTimeCache()  => 10 * 60;

}