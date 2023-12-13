import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/job_user_list_by_user_name_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/job_user_list_by_user_name_response.dart';
import 'package:eportal/repository/admin/job_user_list_by_user_name_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserListByUserNameBloc extends BaseSingleBloc<
    JobUserListByUserNameDataResponse,
    JobUserListByUserNameRepository,
    JobUserListByUserNameEvent,
    JobUserListByUserNameResponse> {
  @override
  Future<JobUserListByUserNameResponse> callApiResult(
          JobUserListByUserNameRepository apiRepository,
          JobUserListByUserNameEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(JobUserListByUserNameResponse response) => null;

  @override
  JobUserListByUserNameRepository getRepository() =>
      JobUserListByUserNameRepository();
}
