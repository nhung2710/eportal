import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/work_send_list_event.dart';
import 'package:eportal/model/api/response/admin/data/work_send_list_data_response.dart';
import 'package:eportal/model/api/response/admin/work_send_list_response.dart';
import 'package:eportal/repository/admin/work_send_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class WorkSendListBloc extends BaseSingleBloc<WorkSendListDataResponse,
    WorkSendListRepository, WorkSendListEvent, WorkSendListResponse> {
  @override
  Future<WorkSendListResponse> callApiResult(
          WorkSendListRepository apiRepository, WorkSendListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(WorkSendListResponse response) => null;

  @override
  WorkSendListRepository getRepository() => WorkSendListRepository();
}
