import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/common_new/video_list_request.dart';
import 'package:eportal/model/api/response/common_new/video_list_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class VideoListRepository {
  Future<VideoListResponse> getVideoList(VideoListRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => VideoListResponse.fromJson(value));
  }
}
