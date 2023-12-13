//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/job_user_history_list_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_add_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_delete_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_update_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_send_data_response.dart';
import 'package:eportal/model/api/response/admin/data/profile_black_list_data_response.dart';
import 'package:eportal/model/api/response/admin/data/profile_save_data_response.dart';
import 'package:eportal/model/api/response/admin/data/profile_save_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class ProfileSaveResponse
    extends BaseSingleEportalResponse<ProfileSaveDataResponse> {
  ProfileSaveResponse(
      {required super.data, required super.status, required super.message});

  factory ProfileSaveResponse.fromJson(Map<String, dynamic> json) {
    return ProfileSaveResponse(
        data: json.toObjectJson(
            mapJson: (v) => ProfileSaveDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
