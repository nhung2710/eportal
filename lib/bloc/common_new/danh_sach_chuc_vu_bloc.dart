import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuc_vu_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_chuc_vu_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuc_vu_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_chuc_vu_repository.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChucVuBloc extends BaseMultiBloc<DanhSachChucVuDataResponse,
    DanhSachChucVuRepository, DanhSachChucVuEvent, DanhSachChucVuResponse> {
  @override
  Future<DanhSachChucVuResponse> callApiResult(
          DanhSachChucVuRepository apiRepository, DanhSachChucVuEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachChucVuResponse response) => null;

  @override
  DanhSachChucVuRepository getRepository() => DanhSachChucVuRepository();
}
