import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_nhu_cau_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_nhu_cau_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nhu_cau_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_nhu_cau_repository.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachNhuCauBloc extends BaseMultiBloc<DanhSachNhuCauDataResponse,
    DanhSachNhuCauRepository, DanhSachNhuCauEvent, DanhSachNhuCauResponse> {
  @override
  Future<DanhSachNhuCauResponse> callApiResult(
          DanhSachNhuCauRepository apiRepository, DanhSachNhuCauEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachNhuCauResponse response) => null;

  @override
  DanhSachNhuCauRepository getRepository() => DanhSachNhuCauRepository();
}
