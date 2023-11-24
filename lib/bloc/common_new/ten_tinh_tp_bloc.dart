//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/ten_tinh_tp_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/ten_tinh_tp_event.dart';
import '../../repository/common_new/ten_tinh_tp_repository.dart';
import '../../state/base/base_state.dart';

class TenTinhTpBloc extends BaseSingleBloc<String, TenTinhTpRepository,
    TenTinhTpEvent, TenTinhTpResponse> {
  @override
  Future<TenTinhTpResponse> callApiResult(
          TenTinhTpRepository apiRepository, TenTinhTpEvent event) =>
      apiRepository.getTenTinhTp(event.request);

  @override
  String? getFailMessage(TenTinhTpResponse response) => null;

  @override
  TenTinhTpRepository getRepository() => TenTinhTpRepository();
}
