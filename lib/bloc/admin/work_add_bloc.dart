import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/work_add_event.dart';
import 'package:eportal/model/api/response/admin/data/work_add_data_response.dart';
import 'package:eportal/model/api/response/admin/work_add_response.dart';
import 'package:eportal/repository/admin/work_add_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class WorkAddBloc extends BaseSingleBloc<WorkAddDataResponse, WorkAddRepository,
    WorkAddEvent, WorkAddResponse> {
  @override
  Future<WorkAddResponse> callApiResult(
          WorkAddRepository apiRepository, WorkAddEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(WorkAddResponse response) => null;

  @override
  WorkAddRepository getRepository() => WorkAddRepository();
}
