//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/work_search_event.dart';
import '../../repository/common_new/work_search_repository.dart';
import '../../state/base/base_state.dart';

class WorkSearchBloc
    extends Bloc<BaseEvent, DataMoreState<WorkSearchDataResponse>> {
  WorkSearchBloc() : super(const DataMoreState<WorkSearchDataResponse>()) {
    final WorkSearchRepository apiRepository = WorkSearchRepository();

    on<WorkSearchEvent>((event, emit) async {
      try {
        if (state.hasReachedMax && event.request.obj.soTrangHienTai != 1) {
          return;
        }
        if (state.status == DataBlocStatus.init ||
            event.request.obj.soTrangHienTai == 1) {
          emit(state.copyWith(status: DataBlocStatus.loading));
        }
        final response = await apiRepository.getWorkSearch(event.request);
        if (event.request.obj.soTrangHienTai == 1) {
          emit(state.copyWith(
              data: response.data,
              hasReachedMax:
                  response.data.length < event.request.obj.soBanGhiTrenTrang,
              status: response.data.isEmpty
                  ? DataBlocStatus.notfound
                  : DataBlocStatus.success));
        } else {
          emit(state.copyWith(
              data: state.data..addAll(response.data),
              hasReachedMax:
                  response.data.length < event.request.obj.soBanGhiTrenTrang,
              status: DataBlocStatus.success));
        }
      } on Exception catch (e) {
        emit(state.copyWith(
            errorMessage: e.toString(),
            status: DataBlocStatus.success,
            hasReachedMax: true));
      }
    });
  }
}
