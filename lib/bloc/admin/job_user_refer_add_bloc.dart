import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/job_user_refer_add_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_add_data_response.dart';
import 'package:eportal/model/api/response/admin/job_user_refer_add_response.dart';
import 'package:eportal/repository/admin/job_user_refer_add_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserReferAddBloc extends BaseSingleBloc<JobUserReferAddDataResponse,
    JobUserReferAddRepository, JobUserReferAddEvent, JobUserReferAddResponse> {
  @override
  Future<JobUserReferAddResponse> callApiResult(
          JobUserReferAddRepository apiRepository,
          JobUserReferAddEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserReferAddResponse response) => null;

  @override
  JobUserReferAddRepository getRepository() => JobUserReferAddRepository();
}
