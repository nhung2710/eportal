import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/job_user_add_event.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_add_data_response.dart';
import 'package:eportal/model/api/response/common_new/job_user_add_response.dart';
import 'package:eportal/repository/common_new/job_user_add_repository.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserAddBloc extends BaseSingleBloc<JobUserAddDataResponse,
    JobUserAddRepository, JobUserAddEvent, JobUserAddResponse> {
  @override
  Future<JobUserAddResponse> callApiResult(
          JobUserAddRepository apiRepository, JobUserAddEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserAddResponse response) => null;

  @override
  JobUserAddRepository getRepository() => JobUserAddRepository();
}
