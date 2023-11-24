//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/home_job_user_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/home_job_user_list_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/home_job_user_list_event.dart';
import '../../repository/common_new/home_job_user_list_repository.dart';
import '../../state/base/base_state.dart';

class HomeJobUserListBloc extends BaseMultiBloc<HomeJobUserListDataResponse,
    HomeJobUserListRepository, HomeJobUserListEvent, HomeJobUserListResponse> {
  @override
  Future<HomeJobUserListResponse> callApiResult(
          HomeJobUserListRepository apiRepository,
          HomeJobUserListEvent event) =>
      apiRepository.getHomeJobUserList(event.request);

  @override
  String? getFailMessage(HomeJobUserListResponse response) => null;

  @override
  HomeJobUserListRepository getRepository() => HomeJobUserListRepository();
}
