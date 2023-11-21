//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/faq_question_search_event.dart';
import 'package:eportal/repository/common_new/faq_question_search_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqQuestionSearchBloc extends Bloc<BaseEvent, BaseState> {
  FaqQuestionSearchBloc() : super(BaseInitial()) {
    final FaqQuestionSearchRepository apiRepository =
        FaqQuestionSearchRepository();

    on<FaqQuestionSearchEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
            await apiRepository.getFaqQuestionSearch(event.request);
        emit(BaseLoaded(response));
        if (response.status != 2) {
          emit(BaseError(response.message));
        }
      } on Exception catch (e) {
        emit(BaseError(e.toString()));
      } catch (e) {
        emit(BaseError(e.toString()));
      }
    });
  }
}
