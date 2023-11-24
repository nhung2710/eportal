import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/home_advertise_list_event.dart';
import 'package:eportal/model/api/response/common_new/data/home_advertise_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/home_advertise_list_response.dart';
import 'package:eportal/repository/common_new/home_advertise_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListBloc extends BaseMultiBloc<
    HomeAdvertiseListDataResponse,
    HomeAdvertiseListRepository,
    HomeAdvertiseListEvent,
    HomeAdvertiseListResponse> {
  @override
  Future<HomeAdvertiseListResponse> callApiResult(
          HomeAdvertiseListRepository apiRepository,
          HomeAdvertiseListEvent event) =>
      apiRepository.getHomeAdvertiseList(event.request);

  @override
  String? getFailMessage(HomeAdvertiseListResponse response) => null;

  @override
  HomeAdvertiseListRepository getRepository() => HomeAdvertiseListRepository();
}
