import 'package:bloc/bloc.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/home_works_list_event.dart';
import 'package:eportal/repository/common_new/home_works_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListBloc extends Bloc<BaseEvent, BaseState> {
  HomeWorksListBloc() : super(BaseInitial()) {
    final HomeWorksListRepository apiRepository = HomeWorksListRepository();

    on<HomeWorksListEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response = await apiRepository.getHomeWorksList(event.request);
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
