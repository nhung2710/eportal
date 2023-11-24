import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/album_detail_event.dart';
import 'package:eportal/model/api/response/common_new/album_detail_response.dart';
import 'package:eportal/model/api/response/common_new/data/album_detail_data_response.dart';
import 'package:eportal/repository/common_new/album_detail_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumDetailBloc extends BaseMultiBloc<AlbumDetailDataResponse,
    AlbumDetailRepository, AlbumDetailEvent, AlbumDetailResponse> {
  @override
  Future<AlbumDetailResponse> callApiResult(
          AlbumDetailRepository apiRepository, AlbumDetailEvent event) =>
      apiRepository.getAlbumDetail(event.request);

  @override
  String? getFailMessage(AlbumDetailResponse response) => null;

  @override
  AlbumDetailRepository getRepository() => AlbumDetailRepository();
}
