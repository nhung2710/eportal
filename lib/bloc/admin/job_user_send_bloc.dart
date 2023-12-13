import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/job_user_send_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_send_data_response.dart';
import 'package:eportal/model/api/response/admin/job_user_send_response.dart';
import 'package:eportal/repository/admin/job_user_send_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserSendBloc extends BaseSingleBloc<JobUserSendDataResponse,
    JobUserSendRepository, JobUserSendEvent, JobUserSendResponse> {
  @override
  Future<JobUserSendResponse> callApiResult(
          JobUserSendRepository apiRepository, JobUserSendEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserSendResponse response) => null;

  @override
  JobUserSendRepository getRepository() => JobUserSendRepository();
}
