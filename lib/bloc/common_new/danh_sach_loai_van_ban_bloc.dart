import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_loai_van_ban_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_loai_van_ban_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_loai_van_ban_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_loai_van_ban_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachLoaiVanBanBloc extends BaseMultiBloc<
    DanhSachLoaiVanBanDataResponse,
    DanhSachLoaiVanBanRepository,
    DanhSachLoaiVanBanEvent,
    DanhSachLoaiVanBanResponse> {
  @override
  Future<DanhSachLoaiVanBanResponse> callApiResult(
          DanhSachLoaiVanBanRepository apiRepository,
          DanhSachLoaiVanBanEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachLoaiVanBanResponse response) => null;

  @override
  DanhSachLoaiVanBanRepository getRepository() =>
      DanhSachLoaiVanBanRepository();
}
