import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_vi_tri_tuyen_dung_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_vi_tri_tuyen_dung_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_vi_tri_tuyen_dung_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_vi_tri_tuyen_dung_repository.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachViTriTuyenDungBloc extends BaseMultiBloc<
    DanhSachViTriTuyenDungDataResponse,
    DanhSachViTriTuyenDungRepository,
    DanhSachViTriTuyenDungEvent,
    DanhSachViTriTuyenDungResponse> {
  @override
  Future<DanhSachViTriTuyenDungResponse> callApiResult(
          DanhSachViTriTuyenDungRepository apiRepository,
          DanhSachViTriTuyenDungEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachViTriTuyenDungResponse response) => null;

  @override
  DanhSachViTriTuyenDungRepository getRepository() =>
      DanhSachViTriTuyenDungRepository();
}
