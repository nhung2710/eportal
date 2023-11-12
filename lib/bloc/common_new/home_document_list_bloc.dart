//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/home_document_list_event.dart';
import '../../repository/common_new/home_document_list_repository.dart';
import '../../state/base/base_state.dart';

class HomeDocumentListBloc extends Bloc<BaseEvent, BaseState> {
  HomeDocumentListBloc() : super(BaseInitial()) {
    final HomeDocumentListRepository apiRepository =
    HomeDocumentListRepository();

    on<HomeDocumentListEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
        await apiRepository.getHomeDocumentList(event.request);
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