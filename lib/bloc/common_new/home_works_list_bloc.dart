import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/home_works_list_event.dart';
import 'package:eportal/model/api/response/common_new/data/home_works_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/home_works_list_response.dart';
import 'package:eportal/repository/common_new/home_works_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomeWorksListBloc extends BaseMultiBloc<HomeWorksListDataResponse,
    HomeWorksListRepository, HomeWorksListEvent, HomeWorksListResponse> {
  @override
  Future<HomeWorksListResponse> callApiResult(
          HomeWorksListRepository apiRepository, HomeWorksListEvent event) =>
      apiRepository.getHomeWorksList(event.request);

  @override
  String? getFailMessage(HomeWorksListResponse response) => null;

  @override
  HomeWorksListRepository getRepository() => HomeWorksListRepository();
}
