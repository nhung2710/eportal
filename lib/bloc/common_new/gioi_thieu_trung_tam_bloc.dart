import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/gioi_thieu_trung_tam_event.dart';
import 'package:eportal/repository/common_new/gioi_thieu_trung_tam_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class GioiThieuTrungTamBloc extends Bloc<BaseEvent, DataState<String>> {
  GioiThieuTrungTamBloc()
      : super(const DataState<String>()) {
    final GioiThieuTrungTamRepository apiRepository =
    GioiThieuTrungTamRepository();

    on<GioiThieuTrungTamEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getGioiThieuTrungTam(event.request);
        if (response.status != 2) {
          emit(state.copyWith(
              errorMessage: response.message, status: DataBlocStatus.error));
        }
        else {
          if (response.data.isNullOrWhiteSpace()) {
            emit(state.copyWith(status: DataBlocStatus.notfound));
          } else {
            emit(state.copyWith(
                data: response.data, status: DataBlocStatus.success));
          }
        }
      } on Exception catch (e) {
        emit(state.copyWith(errorMessage: e.toString(),status: DataBlocStatus.error));
      }
    });
  }
}