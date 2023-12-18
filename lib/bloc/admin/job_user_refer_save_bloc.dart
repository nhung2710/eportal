//
// Created by BlackRose on 18/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/admin/job_user_refer_save_event.dart';
import 'package:eportal/model/api/response/admin/job_user_refer_delete_response.dart';
import 'package:eportal/model/api/response/admin/job_user_refer_update_response.dart';
import 'package:eportal/repository/admin/job_user_refer_add_repository.dart';
import 'package:eportal/repository/admin/job_user_refer_update_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/application_constant.dart';
import '../../model/api/response/admin/job_user_refer_add_response.dart';
import '../../repository/admin/job_user_refer_delete_repository.dart';

class JobUserReferSaveBloc
    extends Bloc<JobUserReferSaveEvent, DataSingleState<Object>> {
  JobUserReferSaveBloc() : super(const DataSingleState<Object>()) {
    final JobUserReferAddRepository jobUserReferAddRepository =
        JobUserReferAddRepository();
    final JobUserReferDeleteRepository jobUserReferDeleteRepository =
        JobUserReferDeleteRepository();
    final JobUserReferUpdateRepository jobUserReferUpdateRepository =
        JobUserReferUpdateRepository();

    on<JobUserReferSaveEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));

        var response = await Future.wait([
          callApiJobUserReferDeleteResult(jobUserReferDeleteRepository, event),
          callApiJobUserReferUpdateResult(jobUserReferUpdateRepository, event),
          callApiJobUserReferAddResult(jobUserReferAddRepository, event),
        ]);
        if (response
            .where(
                (element) => element.where((sub) => sub.status != 2).isNotEmpty)
            .isNotEmpty) {
          emit(state.copyWith(
              errorMessage: ApplicationConstant.SYSTEM_ERROR,
              status: DataBlocStatus.error));
        } else {
          emit(
              state.copyWith(errorMessage: "", status: DataBlocStatus.success));
        }
      } on Exception catch (e) {
        print(e);
        emit(state.copyWith(
            errorMessage: e.toString(), status: DataBlocStatus.error));
      }
    });
  }

  Future<List<JobUserReferAddResponse>> callApiJobUserReferAddResult(
      JobUserReferAddRepository jobUserReferAddRepository,
      JobUserReferSaveEvent event) {
    return Future.wait((event.lstJobUserReferAddRequest ?? [])
        .map((e) => jobUserReferAddRepository.get(e))
        .toList());
  }

  Future<List<JobUserReferDeleteResponse>> callApiJobUserReferDeleteResult(
      JobUserReferDeleteRepository jobUserReferDeleteRepository,
      JobUserReferSaveEvent event) {
    return Future.wait((event.lstJobUserReferDeleteRequest ?? [])
        .map((e) => jobUserReferDeleteRepository.get(e))
        .toList());
  }

  Future<List<JobUserReferUpdateResponse>> callApiJobUserReferUpdateResult(
      JobUserReferUpdateRepository jobUserReferUpdateRepository,
      JobUserReferSaveEvent event) {
    return Future.wait((event.lstJobUserReferUpdateRequest ?? [])
        .map((e) => jobUserReferUpdateRepository.get(e))
        .toList());
  }
}
