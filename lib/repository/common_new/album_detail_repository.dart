import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/album_detail_request.dart';
import 'package:eportal/model/api/response/common_new/album_detail_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumDetailRepository {
  Future<AlbumDetailResponse> getAlbumDetail(AlbumDetailRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => AlbumDetailResponse.fromJson(value));
  }
}
