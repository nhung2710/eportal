import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/dang_ky_event.dart';
import 'package:eportal/model/api/response/common_new/dang_ky_response.dart';
import 'package:eportal/model/api/response/common_new/data/dang_ky_data_response.dart';
import 'package:eportal/repository/common_new/dang_ky_repository.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DangKyBloc extends BaseSingleBloc<DangKyDataResponse, DangKyRepository,
    DangKyEvent, DangKyResponse> {
  @override
  Future<DangKyResponse> callApiResult(
          DangKyRepository apiRepository, DangKyEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DangKyResponse response) => null;

  @override
  DangKyRepository getRepository() => DangKyRepository();
}
