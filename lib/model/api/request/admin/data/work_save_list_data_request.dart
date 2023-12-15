import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/api/request/admin/data/job_user_list_by_user_name_data_request.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class WorkSaveListDataRequest extends JobUserListByUserNameDataRequest {
  WorkSaveListDataRequest(
      {super.tuKhoa,
      super.kieuSapXep,
      super.soTrangHienTai,
      super.soBanGhiTrenTrang});
}
