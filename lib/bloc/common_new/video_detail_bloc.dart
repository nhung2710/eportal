//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/video_detail_event.dart';
import 'package:eportal/model/api/response/common_new/data/video_detail_data_response.dart';
import 'package:eportal/model/api/response/common_new/video_detail_response.dart';
import 'package:eportal/repository/common_new/video_detail_repository.dart';

class VideoDetailBloc extends BaseSingleBloc<VideoDetailDataResponse,
    VideoDetailRepository, VideoDetailEvent, VideoDetailResponse> {
  @override
  Future<VideoDetailResponse> callApiResult(
          VideoDetailRepository apiRepository, VideoDetailEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(VideoDetailResponse response) => null;

  @override
  VideoDetailRepository getRepository() => VideoDetailRepository();
}
