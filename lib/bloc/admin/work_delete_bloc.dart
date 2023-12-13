import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/work_delete_event.dart';
import 'package:eportal/model/api/response/admin/data/work_delete_data_response.dart';
import 'package:eportal/model/api/response/admin/work_delete_response.dart';
import 'package:eportal/repository/admin/work_delete_repository.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class WorkDeleteBloc extends BaseSingleBloc<WorkDeleteDataResponse,
    WorkDeleteRepository, WorkDeleteEvent, WorkDeleteResponse> {
  @override
  Future<WorkDeleteResponse> callApiResult(
          WorkDeleteRepository apiRepository, WorkDeleteEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(WorkDeleteResponse response) => null;

  @override
  WorkDeleteRepository getRepository() => WorkDeleteRepository();
}
