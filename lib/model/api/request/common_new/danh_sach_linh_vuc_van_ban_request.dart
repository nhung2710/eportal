import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_linh_vuc_van_ban_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachLinhVucVanBanRequest
    extends BaseEportalRequest<DanhSachLinhVucVanBanDataRequest> {
  DanhSachLinhVucVanBanRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_DANH_SACH_LINH_VUC_VAN_BAN;
}
