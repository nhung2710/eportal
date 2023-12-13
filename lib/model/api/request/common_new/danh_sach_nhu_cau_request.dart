import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nhu_cau_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachNhuCauRequest
    extends BaseEportalRequest<DanhSachNhuCauDataRequest> {
  DanhSachNhuCauRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.kAPI_COMMON_NEW_OP_DANH_SACH_NHU_CAU;
}
