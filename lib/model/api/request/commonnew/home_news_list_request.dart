import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:eportal/model/api/request/commonnew/data/common_new_data.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeNewsListRequest extends BaseEportalRequest<CommonNewData> {
  HomeNewsListRequest({required super.obj});

  @override
  String getStringUri() =>ApplicationApiConstant.API_COMMONNEW_OP_HOME_SLIDE_LIST;

  @override
  String getTagXml() => 'HomeNewsListResult';
}

