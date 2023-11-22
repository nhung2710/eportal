import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/home_slide_list_data_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/home_slide_list_event.dart';
import '../../repository/common_new/home_slide_list_repository.dart';
import '../../state/base/base_state.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeSlideListBloc extends Bloc<BaseEvent, DataState<List<HomeSlideListDataResponse>>> {
  HomeSlideListBloc() : super(const DataState<List<HomeSlideListDataResponse>>()) {
    final HomeSlideListRepository apiRepository =
    HomeSlideListRepository();

    on<HomeSlideListEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getHomeSlideList(event.request);
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