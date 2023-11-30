import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/home_works_list_data_response.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListResponse
    extends BaseMultiEportalResponse<HomeWorksListDataResponse> {
  HomeWorksListResponse(
      {required super.data, required super.status, required super.message});

  factory HomeWorksListResponse.fromJson(Map<String, dynamic> json) {
    return HomeWorksListResponse(
        data: json.toListObjectJson(
            mapJson: (v) => HomeWorksListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
