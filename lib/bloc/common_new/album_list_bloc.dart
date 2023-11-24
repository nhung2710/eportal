import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/album_list_event.dart';
import 'package:eportal/model/api/response/common_new/album_list_response.dart';
import 'package:eportal/model/api/response/common_new/data/album_list_data_response.dart';
import 'package:eportal/repository/common_new/album_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumListBloc extends BaseMultiBloc<AlbumListDataResponse,
    AlbumListRepository, AlbumListEvent, AlbumListResponse> {
  @override
  Future<AlbumListResponse> callApiResult(
          AlbumListRepository apiRepository, AlbumListEvent event) =>
      apiRepository.getAlbumList(event.request);

  @override
  String? getFailMessage(AlbumListResponse response) => null;

  @override
  AlbumListRepository getRepository() => AlbumListRepository();
}
