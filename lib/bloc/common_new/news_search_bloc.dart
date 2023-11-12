//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/news_search_event.dart';
import '../../repository/common_new/news_search_repository.dart';
import '../../state/base/base_state.dart';

class NewsSearchBloc extends Bloc<BaseEvent, BaseState> {
  NewsSearchBloc() : super(BaseInitial()) {
    final NewsSearchRepository apiRepository =
    NewsSearchRepository();

    on<NewsSearchEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
        await apiRepository.getNewsSearch(event.request);
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