import 'package:eportal/model/api/request/common_new/video_detail_request.dart';
import 'package:eportal/model/api/response/common_new/video_detail_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class VideoDetailRepository
    extends BaseRepository<VideoDetailRequest, VideoDetailResponse> {
  @override
  VideoDetailResponse mapJsonToObject(Map<String, dynamic> value) =>
      VideoDetailResponse.fromJson(value);
}
