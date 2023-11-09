import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/home_works_list/home_works_list_event.dart';
import 'package:eportal/model/api/request/commonnew/home_works_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_works_list_response.dart';
import 'package:eportal/repository/common_new/home_works_list/home_works_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/state/common_new/home_works_list/home_works_list_common_new_state.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListBloc extends Bloc<BaseEvent, BaseState> {

  HomeWorksListBloc() : super(BaseInitial()){
    final HomeWorksListRepository apiRepository = HomeWorksListRepository();

    on<HomeWorksListCommonEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        await Future.delayed(const Duration(seconds: 10));
        final response = await apiRepository.getHomeWorksList(event.request);
        emit(BaseLoaded(response));
        if (response.status != 2) {
          emit(BaseError(response.message));
        }
      } on Exception catch(e) {
        emit(BaseError(e.toString()));
      }
    });
  }

}