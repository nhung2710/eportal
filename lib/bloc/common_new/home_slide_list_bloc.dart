import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/home_slide_list_event.dart';
import '../../repository/common_new/home_slide_list_repository.dart';
import '../../state/base/base_state.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeSlideListBloc extends Bloc<BaseEvent, BaseState> {
  HomeSlideListBloc() : super(BaseInitial()) {
    final HomeSlideListRepository apiRepository = HomeSlideListRepository();

    on<HomeSlideListEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response = await apiRepository.getHomeSlideList(event.request);
        emit(BaseLoaded(response));
        if (response.status != 2) {
          emit(BaseError(response.message));
        }
      } on Exception catch (e) {
        emit(BaseError(e.toString()));
      }
    });
  }
}
