//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/profile_save_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class ProfileSaveListResponse
    extends BaseSingleEportalResponse<ProfileSaveListDataResponse> {
  ProfileSaveListResponse(
      {required super.data, required super.status, required super.message});

  factory ProfileSaveListResponse.fromJson(Map<String, dynamic> json) {
    return ProfileSaveListResponse(
        data: json.toObjectJson(
            mapJson: (v) => ProfileSaveListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
