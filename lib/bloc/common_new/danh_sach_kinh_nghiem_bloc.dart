//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_kinh_nghiem_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';

import '../../event/common_new/danh_sach_kinh_nghiem_event.dart';
import '../../repository/common_new/danh_sach_kinh_nghiem_repository.dart';

class DanhSachKinhNghiemBloc extends BaseMultiBloc<
    DanhSachKinhNghiemDataResponse,
    DanhSachKinhNghiemRepository,
    DanhSachKinhNghiemEvent,
    DanhSachKinhNghiemResponse> {
  @override
  Future<DanhSachKinhNghiemResponse> callApiResult(
          DanhSachKinhNghiemRepository apiRepository,
          DanhSachKinhNghiemEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachKinhNghiemResponse response) => null;

  @override
  DanhSachKinhNghiemRepository getRepository() =>
      DanhSachKinhNghiemRepository();
}
