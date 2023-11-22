import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/danh_sach_co_quan_ban_hanh_event.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_co_quan_ban_hanh_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_co_quan_ban_hanh_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachCoQuanBanHanhBloc extends Bloc<BaseEvent, DataState<List<DanhSachCoQuanBanHanhDataResponse>>> {
  DanhSachCoQuanBanHanhBloc() : super(const DataState<List<DanhSachCoQuanBanHanhDataResponse>>()) {
    final DanhSachCoQuanBanHanhRepository apiRepository =
    DanhSachCoQuanBanHanhRepository();

    on<DanhSachCoQuanBanHanhEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getDanhSachCoQuanBanHanh(event.request);
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