import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_nhu_cau_viec_lam_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_nhu_cau_viec_lam_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nhu_cau_viec_lam_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_nhu_cau_viec_lam_repository.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachNhuCauViecLamBloc extends BaseMultiBloc<
    DanhSachNhuCauViecLamDataResponse,
    DanhSachNhuCauViecLamRepository,
    DanhSachNhuCauViecLamEvent,
    DanhSachNhuCauViecLamResponse> {
  @override
  Future<DanhSachNhuCauViecLamResponse> callApiResult(
          DanhSachNhuCauViecLamRepository apiRepository,
          DanhSachNhuCauViecLamEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachNhuCauViecLamResponse response) => null;

  @override
  DanhSachNhuCauViecLamRepository getRepository() =>
      DanhSachNhuCauViecLamRepository();
}
