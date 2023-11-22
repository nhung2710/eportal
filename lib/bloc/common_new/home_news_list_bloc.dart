import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/home_news_list_event.dart';
import 'package:eportal/model/api/response/common_new/data/home_news_list_data_response.dart';
import 'package:eportal/repository/common_new/home_news_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeNewsListBloc extends Bloc<BaseEvent, DataState<List<HomeNewsListDataResponse>>> {
  HomeNewsListBloc() : super(const DataState<List<HomeNewsListDataResponse>>()) {
    final HomeNewsListRepository apiRepository =
    HomeNewsListRepository();

    on<HomeNewsListEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getHomeNewsList(event.request);
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