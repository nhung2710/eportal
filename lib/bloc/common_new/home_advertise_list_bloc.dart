import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/home_advertise_list_event.dart';
import 'package:eportal/model/api/response/common_new/data/home_advertise_list_data_response.dart';
import 'package:eportal/repository/common_new/home_advertise_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListBloc
    extends Bloc<BaseEvent, DataState<List<HomeAdvertiseListDataResponse>>> {
  HomeAdvertiseListBloc()
      : super(const DataState<List<HomeAdvertiseListDataResponse>>()) {
    final HomeAdvertiseListRepository apiRepository =
        HomeAdvertiseListRepository();

    on<HomeAdvertiseListEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
            await apiRepository.getHomeAdvertiseList(event.request);
        if (response.status != 2) {
          emit(state.copyWith(
              errorMessage: response.message, status: DataBlocStatus.error));
        } else {
          if (response.data.isEmpty) {
            emit(state.copyWith(status: DataBlocStatus.notfound));
          } else {
            emit(state.copyWith(
                data: response.data, status: DataBlocStatus.success));
          }
        }
      } on Exception catch (e) {
        emit(state.copyWith(
            errorMessage: e.toString(), status: DataBlocStatus.error));
      }
    });
  }
}
