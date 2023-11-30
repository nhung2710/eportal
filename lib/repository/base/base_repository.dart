import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';
import 'package:flutter/material.dart';

import '../../model/base/base_eportal_response.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
abstract class BaseRepository<RQ extends BaseEportalRequest,
    RP extends BaseEportalResponse> {
  Future<RP> get(RQ request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => mapJsonToObject(value));
  }

  RP mapJsonToObject(Map<String, dynamic> value);
}
