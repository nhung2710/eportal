import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/album_detail_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class AlbumDetailEvent extends BaseEvent<AlbumDetailRequest> {
  const AlbumDetailEvent({required super.request});
}
