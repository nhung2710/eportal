import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/model/api/response/common_new/data/home_slide_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/home_slide_list_response.dart';

import '../../event/common_new/home_slide_list_event.dart';
import '../../repository/common_new/home_slide_list_repository.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeSlideListBloc extends BaseMultiBloc<HomeSlideListDataResponse,
    HomeSlideListRepository, HomeSlideListEvent, HomeSlideListResponse> {
  @override
  Future<HomeSlideListResponse> callApiResult(
          HomeSlideListRepository apiRepository, HomeSlideListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(HomeSlideListResponse response) => null;

  @override
  HomeSlideListRepository getRepository() => HomeSlideListRepository();
}
