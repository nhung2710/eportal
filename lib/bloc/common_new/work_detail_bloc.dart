//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/work_detail_event.dart';
import '../../repository/common_new/work_detail_repository.dart';
import '../../state/base/base_state.dart';

class WorkDetailBloc extends Bloc<BaseEvent, DataState<String>> {
  WorkDetailBloc() : super(const DataState<String>()) {
    final WorkDetailRepository apiRepository =
    WorkDetailRepository();

    on<WorkDetailEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getWorkDetail(event.request);
        if (response.status != 2) {
          emit(state.copyWith(errorMessage: response.message,status: DataBlocStatus.error));
        }
        else{
          emit(state.copyWith(data: response.data,status: DataBlocStatus.success));
        }

      } on Exception catch (e) {
        emit(state.copyWith(errorMessage: e.toString(),status: DataBlocStatus.error));
      }
    });
  }
}