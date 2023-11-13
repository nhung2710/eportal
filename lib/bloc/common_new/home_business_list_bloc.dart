//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/home_business_list_event.dart';
import '../../repository/common_new/home_business_list_repository.dart';
import '../../state/base/base_state.dart';

class HomeBusinessListBloc extends Bloc<BaseEvent, BaseState> {
  HomeBusinessListBloc() : super(BaseInitial()) {
    final HomeBusinessListRepository apiRepository =
    HomeBusinessListRepository();

    on<HomeBusinessListEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
        await apiRepository.getHomeBusinessList(event.request);

        if ((response.status??0) != 2) {
          emit(BaseError(response.message));
        }
        else {
          emit(BaseLoaded(response));
        }
      } on Exception catch (e) {
        emit(BaseError(e.toString()));
      }
    });
  }
}