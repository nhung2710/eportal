//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_trinh_do_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_trinh_do_data_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_trinh_do_event.dart';
import '../../repository/common_new/danh_sach_trinh_do_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachTrinhDoBloc extends BaseMultiBloc<DanhSachTrinhDoDataResponse,
    DanhSachTrinhDoRepository, DanhSachTrinhDoEvent, DanhSachTrinhDoResponse> {
  @override
  Future<DanhSachTrinhDoResponse> callApiResult(
          DanhSachTrinhDoRepository apiRepository,
          DanhSachTrinhDoEvent event) =>
      apiRepository.getDanhSachTrinhDo(event.request);

  @override
  String? getFailMessage(DanhSachTrinhDoResponse response) => null;

  @override
  DanhSachTrinhDoRepository getRepository() => DanhSachTrinhDoRepository();
}
