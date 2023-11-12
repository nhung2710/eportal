//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/news_detail_event.dart';
import '../../repository/common_new/news_detail_repository.dart';
import '../../state/base/base_state.dart';

class NewsDetailBloc extends Bloc<BaseEvent, BaseState> {
  NewsDetailBloc() : super(BaseInitial()) {
    final NewsDetailRepository apiRepository =
    NewsDetailRepository();

    on<NewsDetailEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
        await apiRepository.getNewsDetail(event.request);
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