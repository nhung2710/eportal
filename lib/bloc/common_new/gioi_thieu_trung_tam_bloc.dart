import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/gioi_thieu_trung_tam_event.dart';
import 'package:eportal/model/api/response/common_new/gioi_thieu_trung_tam_response.dart';
import 'package:eportal/repository/common_new/gioi_thieu_trung_tam_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class GioiThieuTrungTamBloc extends BaseSingleBloc<
    String,
    GioiThieuTrungTamRepository,
    GioiThieuTrungTamEvent,
    GioiThieuTrungTamResponse> {
  @override
  Future<GioiThieuTrungTamResponse> callApiResult(
          GioiThieuTrungTamRepository apiRepository,
          GioiThieuTrungTamEvent event) =>
      apiRepository.getGioiThieuTrungTam(event.request);

  @override
  String? getFailMessage(GioiThieuTrungTamResponse response) => null;

  @override
  GioiThieuTrungTamRepository getRepository() => GioiThieuTrungTamRepository();
}
