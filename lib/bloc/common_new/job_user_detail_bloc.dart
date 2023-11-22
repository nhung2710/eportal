//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/job_user_detail_event.dart';
import '../../repository/common_new/job_user_detail_repository.dart';
import '../../state/base/base_state.dart';

class JobUserDetailBloc extends Bloc<BaseEvent, DataState<String>> {
  JobUserDetailBloc() : super(const DataState<String>()) {
    final JobUserDetailRepository apiRepository =
    JobUserDetailRepository();

    on<JobUserDetailEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getJobUserDetail(event.request);
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