//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_trinh_do_data_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_trinh_do_event.dart';
import '../../repository/common_new/danh_sach_trinh_do_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachTrinhDoBloc extends Bloc<BaseEvent, DataState<List<DanhSachTrinhDoDataResponse>>> {
  DanhSachTrinhDoBloc() : super(const DataState<List<DanhSachTrinhDoDataResponse>>()) {
    final DanhSachTrinhDoRepository apiRepository =
    DanhSachTrinhDoRepository();

    on<DanhSachTrinhDoEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getDanhSachTrinhDo(event.request);
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