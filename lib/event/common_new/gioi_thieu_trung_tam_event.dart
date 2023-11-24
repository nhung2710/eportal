import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/gioi_thieu_trung_tam_request.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GioiThieuTrungTamEvent extends BaseSingleEvent<GioiThieuTrungTamRequest> {
  const GioiThieuTrungTamEvent({required super.request});
}
