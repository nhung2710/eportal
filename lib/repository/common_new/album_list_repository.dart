import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/album_list_request.dart';
import 'package:eportal/model/api/response/common_new/album_list_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumListRepository {
  Future<AlbumListResponse> getAlbumList(AlbumListRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => AlbumListResponse.fromJson(value));
  }
}
