//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/work_detail_request.dart';
import 'package:eportal/model/api/response/common_new/work_detail_response.dart';

class WorkDetailRepository {
  Future<WorkDetailResponse> getWorkDetail(WorkDetailRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => WorkDetailResponse.fromJson(value));
  }
}
