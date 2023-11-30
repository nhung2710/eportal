import 'package:eportal/model/api/response/common_new/data/album_detail_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumDetailResponse
    extends BaseMultiEportalResponse<AlbumDetailDataResponse> {
  AlbumDetailResponse(
      {required super.data, required super.status, required super.message});

  factory AlbumDetailResponse.fromJson(Map<String, dynamic> json) {
    return AlbumDetailResponse(
        data: json.toListObjectJson(
            mapJson: (v) => AlbumDetailDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
