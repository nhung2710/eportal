import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/model/api/response/common_new/dang_nhap_response.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/repository/common_new/dang_nhap_repository.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangNhapBloc extends BaseSingleBloc<DangNhapDataResponse,
    DangNhapRepository, DangNhapEvent, DangNhapResponse> {
  @override
  Future<DangNhapResponse> callApiResult(
          DangNhapRepository apiRepository, DangNhapEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DangNhapResponse response) =>
      (response.data?.userName).isNullOrWhiteSpace()
          ? getMessageError((response.data?.message)
              .replaceWhenNullOrWhiteSpace(response.message))
          : null;

  @override
  DangNhapRepository getRepository() => DangNhapRepository();
}
