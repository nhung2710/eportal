import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/album_list_event.dart';
import 'package:eportal/model/api/response/common_new/album_list_response.dart';
import 'package:eportal/model/api/response/common_new/data/album_list_data_response.dart';
import 'package:eportal/repository/common_new/album_list_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumListBloc extends BasePageBloc<AlbumListDataResponse,
    AlbumListRepository, AlbumListEvent, AlbumListResponse> {
  @override
  Future<AlbumListResponse> callApiResult(
          AlbumListRepository apiRepository, AlbumListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(AlbumListResponse response) => null;

  @override
  AlbumListRepository getRepository() => AlbumListRepository();
}
