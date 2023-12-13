import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/job_user_refer_list_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_list_data_response.dart';
import 'package:eportal/model/api/response/admin/job_user_refer_list_response.dart';
import 'package:eportal/repository/admin/job_user_refer_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserReferListBloc extends BaseSingleBloc<
    JobUserReferListDataResponse,
    JobUserReferListRepository,
    JobUserReferListEvent,
    JobUserReferListResponse> {
  @override
  Future<JobUserReferListResponse> callApiResult(
          JobUserReferListRepository apiRepository,
          JobUserReferListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserReferListResponse response) => null;

  @override
  JobUserReferListRepository getRepository() => JobUserReferListRepository();
}
