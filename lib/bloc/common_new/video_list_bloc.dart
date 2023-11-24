//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/video_list_event.dart';
import 'package:eportal/model/api/response/common_new/video_list_response.dart';
import 'package:eportal/repository/common_new/video_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/api/response/common_new/data/video_list_data_response.dart';
import '../base/base_bloc.dart';

class VideoListBloc extends BasePageBloc<VideoListDataResponse,
    VideoListRepository, VideoListEvent, VideoListResponse> {
  @override
  Future<VideoListResponse> callApiResult(
          VideoListRepository apiRepository, VideoListEvent event) =>
      apiRepository.getVideoList(event.request);

  @override
  String? getFailMessage(VideoListResponse response) => null;

  @override
  VideoListRepository getRepository() => VideoListRepository();
}
