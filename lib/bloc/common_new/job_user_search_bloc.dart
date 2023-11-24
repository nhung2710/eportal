//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_search_data_response.dart';
import 'package:eportal/model/api/response/common_new/job_user_search_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/job_user_search_event.dart';
import '../../repository/common_new/job_user_search_repository.dart';
import '../../state/base/base_state.dart';

class JobUserSearchBloc extends BasePageBloc<JobUserSearchDataResponse,
    JobUserSearchRepository, JobUserSearchEvent, JobUserSearchResponse> {
  @override
  Future<JobUserSearchResponse> callApiResult(
          JobUserSearchRepository apiRepository, JobUserSearchEvent event) =>
      apiRepository.getJobUserSearch(event.request);

  @override
  String? getFailMessage(JobUserSearchResponse response) => null;

  @override
  JobUserSearchRepository getRepository() => JobUserSearchRepository();
}
