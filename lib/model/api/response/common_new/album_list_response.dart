import 'package:eportal/model/api/response/common_new/data/album_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumListResponse
    extends BaseMultiEportalResponse<AlbumListDataResponse> {
  AlbumListResponse(
      {required super.data, required super.status, required super.message});

  factory AlbumListResponse.fromJson(Map<String, dynamic> json) {
    List<AlbumListDataResponse> data = <AlbumListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(AlbumListDataResponse.fromJson(v));
      });
    }
    return AlbumListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
