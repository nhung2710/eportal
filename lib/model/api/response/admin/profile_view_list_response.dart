//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/profile_view_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

class ProfileViewListResponse
    extends BaseSingleEportalResponse<ProfileViewListDataResponse> {
  ProfileViewListResponse(
      {required super.data, required super.status, required super.message});

  factory ProfileViewListResponse.fromJson(Map<String, dynamic> json) {
    return ProfileViewListResponse(
        data: json.toObjectJson(
            mapJson: (v) => ProfileViewListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
