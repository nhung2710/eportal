import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/work_save_list_event.dart';
import 'package:eportal/model/api/response/admin/data/work_save_list_data_response.dart';
import 'package:eportal/model/api/response/admin/work_save_list_response.dart';
import 'package:eportal/repository/admin/work_save_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSaveListBloc extends BasePageBloc<WorkSaveListDataResponse,
    WorkSaveListRepository, WorkSaveListEvent, WorkSaveListResponse> {
  @override
  Future<WorkSaveListResponse> callApiResult(
          WorkSaveListRepository apiRepository, WorkSaveListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(WorkSaveListResponse response) => null;

  @override
  WorkSaveListRepository getRepository() => WorkSaveListRepository();
}
