import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/job_user_update_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_update_data_response.dart';
import 'package:eportal/model/api/response/admin/job_user_update_response.dart';
import 'package:eportal/repository/admin/job_user_update_repository.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserUpdateBloc extends BaseSingleBloc<List<JobUserUpdateDataResponse>,
    JobUserUpdateRepository, JobUserUpdateEvent, JobUserUpdateResponse> {
  @override
  Future<JobUserUpdateResponse> callApiResult(
          JobUserUpdateRepository apiRepository, JobUserUpdateEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserUpdateResponse response) => null;

  @override
  JobUserUpdateRepository getRepository() => JobUserUpdateRepository();
}
