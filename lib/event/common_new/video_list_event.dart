import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/video_list_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class VideoListEvent extends BasePageEvent<VideoListRequest> {
  const VideoListEvent({required super.request});
}
