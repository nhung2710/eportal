import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';
import 'data/home_slide_list_data_response.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeSlideListResponse
    extends BaseMultiEportalResponse<HomeSlideListDataResponse> {
  HomeSlideListResponse(
      {required super.data, required super.status, required super.message});

  factory HomeSlideListResponse.fromJson(Map<String, dynamic> json) {
    return HomeSlideListResponse(
        data: json.toListObjectJson(
            mapJson: (v) => HomeSlideListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
