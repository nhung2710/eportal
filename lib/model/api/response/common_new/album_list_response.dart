import 'package:eportal/model/api/response/common_new/data/album_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

import '../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumListResponse extends BasePageEportalResponse<AlbumListDataResponse> {
  AlbumListResponse(
      {required super.data, required super.status, required super.message});

  factory AlbumListResponse.fromJson(Map<String, dynamic> json) {
    return AlbumListResponse(
        data: json.toListObjectJson(
            mapJson: (v) => AlbumListDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}
