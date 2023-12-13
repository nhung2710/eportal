import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/job_user_refer_update_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_update_data_response.dart';
import 'package:eportal/model/api/response/admin/job_user_refer_update_response.dart';
import 'package:eportal/repository/admin/job_user_refer_update_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferUpdateBloc extends BaseSingleBloc<
    JobUserReferUpdateDataResponse,
    JobUserReferUpdateRepository,
    JobUserReferUpdateEvent,
    JobUserReferUpdateResponse> {
  @override
  Future<JobUserReferUpdateResponse> callApiResult(
          JobUserReferUpdateRepository apiRepository,
          JobUserReferUpdateEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserReferUpdateResponse response) => null;

  @override
  JobUserReferUpdateRepository getRepository() =>
      JobUserReferUpdateRepository();
}
