import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/home_news_list_event.dart';
import 'package:eportal/model/api/response/common_new/data/home_news_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/home_news_list_response.dart';
import 'package:eportal/repository/common_new/home_news_list_repository.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeNewsListBloc extends BaseMultiBloc<HomeNewsListDataResponse,
    HomeNewsListRepository, HomeNewsListEvent, HomeNewsListResponse> {
  @override
  Future<HomeNewsListResponse> callApiResult(
          HomeNewsListRepository apiRepository, HomeNewsListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(HomeNewsListResponse response) => null;

  @override
  HomeNewsListRepository getRepository() => HomeNewsListRepository();
}
