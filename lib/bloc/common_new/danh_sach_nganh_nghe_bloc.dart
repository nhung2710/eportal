import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_nganh_nghe_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_nganh_nghe_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_nganh_nghe_repository.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachNganhNgheBloc extends BaseMultiBloc<
    DanhSachNganhNgheDataResponse,
    DanhSachNganhNgheRepository,
    DanhSachNganhNgheEvent,
    DanhSachNganhNgheResponse> {
  @override
  Future<DanhSachNganhNgheResponse> callApiResult(
          DanhSachNganhNgheRepository apiRepository,
          DanhSachNganhNgheEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachNganhNgheResponse response) => null;

  @override
  DanhSachNganhNgheRepository getRepository() => DanhSachNganhNgheRepository();
}
