import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/video_detail_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class VideoDetailRequest extends BaseEportalRequest<VideoDetailDataRequest> {
  VideoDetailRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_HIGH_DEFAULT;

  @override
  String getQuery() => ApplicationApiConstant.kAPI_COMMON_NEW_OP_VIDEO_DETAIL;
}
