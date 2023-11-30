import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuyen_muc_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_chuyen_muc_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuyen_muc_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_chuyen_muc_repository.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChuyenMucBloc extends BaseMultiBloc<
    DanhSachChuyenMucDataResponse,
    DanhSachChuyenMucRepository,
    DanhSachChuyenMucEvent,
    DanhSachChuyenMucResponse> {
  @override
  Future<DanhSachChuyenMucResponse> callApiResult(
          DanhSachChuyenMucRepository apiRepository,
          DanhSachChuyenMucEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachChuyenMucResponse response) => null;

  @override
  DanhSachChuyenMucRepository getRepository() => DanhSachChuyenMucRepository();
}
