//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/work_detail_data_response.dart';
import 'package:eportal/model/api/response/common_new/work_detail_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/work_detail_event.dart';
import '../../repository/common_new/work_detail_repository.dart';
import '../../state/base/base_state.dart';

class WorkDetailBloc extends BaseSingleBloc<WorkDetailDataResponse,
    WorkDetailRepository, WorkDetailEvent, WorkDetailResponse> {
  @override
  Future<WorkDetailResponse> callApiResult(
          WorkDetailRepository apiRepository, WorkDetailEvent event) =>
      apiRepository.getWorkDetail(event.request);

  @override
  String? getFailMessage(WorkDetailResponse response) => null;

  @override
  WorkDetailRepository getRepository() => WorkDetailRepository();
}
