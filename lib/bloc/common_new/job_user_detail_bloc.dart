//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/common_new/home_works_list_event.dart';
import 'package:eportal/model/api/response/common_new/data/home_works_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_detail_data_response.dart';
import 'package:eportal/model/api/response/common_new/home_works_list_response.dart';
import 'package:eportal/model/api/response/common_new/job_user_detail_response.dart';
import 'package:eportal/repository/common_new/home_works_list_repository.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/job_user_detail_event.dart';
import '../../repository/common_new/job_user_detail_repository.dart';
import '../../state/base/base_state.dart';

class JobUserDetailBloc extends BaseSingleBloc<JobUserDetailDataResponse,
    JobUserDetailRepository, JobUserDetailEvent, JobUserDetailResponse> {
  @override
  Future<JobUserDetailResponse> callApiResult(
          JobUserDetailRepository apiRepository, JobUserDetailEvent event) =>
      apiRepository.getJobUserDetail(event.request);

  @override
  String? getFailMessage(JobUserDetailResponse response) => null;

  @override
  JobUserDetailRepository getRepository() => JobUserDetailRepository();
}
