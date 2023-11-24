//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_quan_huyen_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_quan_huyen_event.dart';
import '../../repository/common_new/danh_sach_quan_huyen_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachQuanHuyenBloc extends BaseMultiBloc<
    DanhSachQuanHuyenDataResponse,
    DanhSachQuanHuyenRepository,
    DanhSachQuanHuyenEvent,
    DanhSachQuanHuyenResponse> {
  @override
  Future<DanhSachQuanHuyenResponse> callApiResult(
          DanhSachQuanHuyenRepository apiRepository,
          DanhSachQuanHuyenEvent event) =>
      apiRepository.getDanhSachQuanHuyen(event.request);

  @override
  String? getFailMessage(DanhSachQuanHuyenResponse response) => null;

  @override
  DanhSachQuanHuyenRepository getRepository() => DanhSachQuanHuyenRepository();
}
