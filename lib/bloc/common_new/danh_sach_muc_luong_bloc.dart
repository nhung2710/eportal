//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_muc_luong_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_muc_luong_event.dart';
import '../../repository/common_new/danh_sach_muc_luong_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachMucLuongBloc extends BaseMultiBloc<
    DanhSachMucLuongDataResponse,
    DanhSachMucLuongRepository,
    DanhSachMucLuongEvent,
    DanhSachMucLuongResponse> {
  @override
  Future<DanhSachMucLuongResponse> callApiResult(
          DanhSachMucLuongRepository apiRepository,
          DanhSachMucLuongEvent event) =>
      apiRepository.getDanhSachMucLuong(event.request);

  @override
  String? getFailMessage(DanhSachMucLuongResponse response) => null;

  @override
  DanhSachMucLuongRepository getRepository() => DanhSachMucLuongRepository();
}
