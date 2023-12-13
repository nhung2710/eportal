import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/job_user_history_list_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_history_list_data_response.dart';
import 'package:eportal/model/api/response/admin/job_user_history_list_response.dart';
import 'package:eportal/repository/admin/job_user_history_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserHistoryListBloc extends BaseSingleBloc<
    JobUserHistoryListDataResponse,
    JobUserHistoryListRepository,
    JobUserHistoryListEvent,
    JobUserHistoryListResponse> {
  @override
  Future<JobUserHistoryListResponse> callApiResult(
          JobUserHistoryListRepository apiRepository,
          JobUserHistoryListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserHistoryListResponse response) => null;

  @override
  JobUserHistoryListRepository getRepository() =>
      JobUserHistoryListRepository();
}
