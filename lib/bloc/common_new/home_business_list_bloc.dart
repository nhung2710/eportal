//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/model/api/response/common_new/data/home_business_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/home_business_list_response.dart';

import '../../event/common_new/home_business_list_event.dart';
import '../../repository/common_new/home_business_list_repository.dart';

class HomeBusinessListBloc extends BaseMultiBloc<
    HomeBusinessListDataResponse,
    HomeBusinessListRepository,
    HomeBusinessListEvent,
    HomeBusinessListResponse> {
  @override
  Future<HomeBusinessListResponse> callApiResult(
          HomeBusinessListRepository apiRepository,
          HomeBusinessListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(HomeBusinessListResponse response) => null;

  @override
  HomeBusinessListRepository getRepository() => HomeBusinessListRepository();
}
