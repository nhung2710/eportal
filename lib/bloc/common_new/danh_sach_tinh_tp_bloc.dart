//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_tinh_tp_event.dart';
import '../../model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import '../../repository/common_new/danh_sach_tinh_tp_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachTinhTpBloc extends Bloc<BaseEvent, DataState<List<DanhSachTinhTpDataResponse>>> {
  DanhSachTinhTpBloc() : super(const DataState<List<DanhSachTinhTpDataResponse>>()) {
    final DanhSachTinhTpRepository apiRepository =
    DanhSachTinhTpRepository();

    on<DanhSachTinhTpEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getDanhSachTinhTp(event.request);
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