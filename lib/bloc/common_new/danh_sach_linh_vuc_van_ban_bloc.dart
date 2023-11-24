import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/danh_sach_linh_vuc_van_ban_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_linh_vuc_van_ban_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_linh_vuc_van_ban_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_linh_vuc_van_ban_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachLinhVucVanBanBloc extends BaseMultiBloc<
    DanhSachLinhVucVanBanDataResponse,
    DanhSachLinhVucVanBanRepository,
    DanhSachLinhVucVanBanEvent,
    DanhSachLinhVucVanBanResponse> {
  @override
  Future<DanhSachLinhVucVanBanResponse> callApiResult(
          DanhSachLinhVucVanBanRepository apiRepository,
          DanhSachLinhVucVanBanEvent event) =>
      apiRepository.getDanhSachLinhVucVanBan(event.request);

  @override
  String? getFailMessage(DanhSachLinhVucVanBanResponse response) => null;

  @override
  DanhSachLinhVucVanBanRepository getRepository() =>
      DanhSachLinhVucVanBanRepository();
}
