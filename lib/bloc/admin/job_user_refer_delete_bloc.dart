import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/job_user_refer_delete_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_delete_data_response.dart';
import 'package:eportal/model/api/response/admin/job_user_refer_delete_response.dart';
import 'package:eportal/repository/admin/job_user_refer_delete_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserReferDeleteBloc extends BaseSingleBloc<
    JobUserReferDeleteDataResponse,
    JobUserReferDeleteRepository,
    JobUserReferDeleteEvent,
    JobUserReferDeleteResponse> {
  @override
  Future<JobUserReferDeleteResponse> callApiResult(
          JobUserReferDeleteRepository apiRepository,
          JobUserReferDeleteEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserReferDeleteResponse response) => null;

  @override
  JobUserReferDeleteRepository getRepository() =>
      JobUserReferDeleteRepository();
}
