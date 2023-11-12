//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/job_user_detail_event.dart';
import '../../repository/common_new/job_user_detail_repository.dart';
import '../../state/base/base_state.dart';

class JobUserDetailBloc extends Bloc<BaseEvent, BaseState> {
  JobUserDetailBloc() : super(BaseInitial()) {
    final JobUserDetailRepository apiRepository =
    JobUserDetailRepository();

    on<JobUserDetailEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
        await apiRepository.getJobUserDetail(event.request);
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