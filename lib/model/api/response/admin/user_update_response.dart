import 'package:eportal/model/api/response/admin/data/user_update_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class UserUpdateResponse
    extends BaseSingleEportalResponse<UserUpdateDataResponse> {
  UserUpdateResponse(
      {required super.data, required super.status, required super.message});

  factory UserUpdateResponse.fromJson(Map<String, dynamic> json) {
    return UserUpdateResponse(
        data: json.toObjectJson(
            mapJson: (v) => UserUpdateDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
