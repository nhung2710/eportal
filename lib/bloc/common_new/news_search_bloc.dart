//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/news_search_data_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/news_search_event.dart';
import '../../repository/common_new/news_search_repository.dart';
import '../../state/base/base_state.dart';

class NewsSearchBloc extends Bloc<BaseEvent, DataState<List<NewsSearchDataResponse>>> {
  NewsSearchBloc() : super(const DataState<List<NewsSearchDataResponse>>()) {
    final NewsSearchRepository apiRepository =
    NewsSearchRepository();

    on<NewsSearchEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getNewsSearch(event.request);
        if (response.status != 2) {
          emit(state.copyWith(errorMessage: response.message,status: DataBlocStatus.error));
        }
        else{
          if(response.data.isEmpty) {
            emit(state.copyWith(status: DataBlocStatus.notfound));
          } else {
            emit(state.copyWith(data: response.data,status: DataBlocStatus.success));
          }
        }

      } on Exception catch (e) {
        emit(state.copyWith(errorMessage: e.toString(),status: DataBlocStatus.error));
      }
    });
  }
}