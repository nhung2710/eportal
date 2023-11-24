//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_tinh_tp_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_tinh_tp_event.dart';
import '../../model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import '../../repository/common_new/danh_sach_tinh_tp_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachTinhTpBloc extends BaseMultiBloc<DanhSachTinhTpDataResponse,
    DanhSachTinhTpRepository, DanhSachTinhTpEvent, DanhSachTinhTpResponse> {
  @override
  Future<DanhSachTinhTpResponse> callApiResult(
          DanhSachTinhTpRepository apiRepository, DanhSachTinhTpEvent event) =>
      apiRepository.getDanhSachTinhTp(event.request);

  @override
  String? getFailMessage(DanhSachTinhTpResponse response) => null;

  @override
  DanhSachTinhTpRepository getRepository() => DanhSachTinhTpRepository();
}
