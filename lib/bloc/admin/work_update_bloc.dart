import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/work_update_event.dart';
import 'package:eportal/model/api/response/admin/data/work_update_data_response.dart';
import 'package:eportal/model/api/response/admin/work_update_response.dart';
import 'package:eportal/repository/admin/work_update_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class WorkUpdateBloc extends BaseSingleBloc<WorkUpdateDataResponse,
    WorkUpdateRepository, WorkUpdateEvent, WorkUpdateResponse> {
  @override
  Future<WorkUpdateResponse> callApiResult(
          WorkUpdateRepository apiRepository, WorkUpdateEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(WorkUpdateResponse response) => null;

  @override
  WorkUpdateRepository getRepository() => WorkUpdateRepository();
}
