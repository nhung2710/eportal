import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/album_list_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumListEvent extends BaseMultiEvent<AlbumListRequest> {
  const AlbumListEvent({required super.request});
}
