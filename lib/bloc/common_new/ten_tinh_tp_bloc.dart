//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/ten_tinh_tp_event.dart';
import '../../repository/common_new/ten_tinh_tp_repository.dart';
import '../../state/base/base_state.dart';

class TenTinhTpBloc extends Bloc<BaseEvent, DataState<String>> {
  TenTinhTpBloc() : super(const DataState<String>()) {
    final TenTinhTpRepository apiRepository =
    TenTinhTpRepository();

    on<TenTinhTpEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getTenTinhTp(event.request);
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