//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_doanh_nghiep_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_doanh_nghiep_data_response.dart';

import '../../event/common_new/danh_sach_doanh_nghiep_event.dart';
import '../../repository/common_new/danh_sach_doanh_nghiep_repository.dart';

class DanhSachDoanhNghiepBloc extends BaseMultiBloc<
    DanhSachDoanhNghiepDataResponse,
    DanhSachDoanhNghiepRepository,
    DanhSachDoanhNghiepEvent,
    DanhSachDoanhNghiepResponse> {
  @override
  Future<DanhSachDoanhNghiepResponse> callApiResult(
          DanhSachDoanhNghiepRepository apiRepository,
          DanhSachDoanhNghiepEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachDoanhNghiepResponse response) => null;

  @override
  DanhSachDoanhNghiepRepository getRepository() =>
      DanhSachDoanhNghiepRepository();
}
