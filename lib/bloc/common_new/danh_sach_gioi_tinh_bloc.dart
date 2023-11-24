//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_gioi_tinh_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_gioi_tinh_data_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_gioi_tinh_event.dart';
import '../../repository/common_new/danh_sach_gioi_tinh_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachGioiTinhBloc extends BaseMultiBloc<
    DanhSachGioiTinhDataResponse,
    DanhSachGioiTinhRepository,
    DanhSachGioiTinhEvent,
    DanhSachGioiTinhResponse> {
  @override
  Future<DanhSachGioiTinhResponse> callApiResult(
          DanhSachGioiTinhRepository apiRepository,
          DanhSachGioiTinhEvent event) =>
      apiRepository.getDanhSachGioiTinh(event.request);

  @override
  String? getFailMessage(DanhSachGioiTinhResponse response) => null;

  @override
  DanhSachGioiTinhRepository getRepository() => DanhSachGioiTinhRepository();
}
