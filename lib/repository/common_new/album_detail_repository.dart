import 'package:eportal/model/api/request/common_new/album_detail_request.dart';
import 'package:eportal/model/api/response/common_new/album_detail_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumDetailRepository
    extends BaseRepository<AlbumDetailRequest, AlbumDetailResponse> {
  @override
  AlbumDetailResponse mapJsonToObject(Map<String, dynamic> value) =>
      AlbumDetailResponse.fromJson(value);
}
