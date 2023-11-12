//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_muc_luong_event.dart';
import '../../repository/common_new/danh_sach_muc_luong_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachMucLuongBloc extends Bloc<BaseEvent, BaseState> {
  DanhSachMucLuongBloc() : super(BaseInitial()) {
    final DanhSachMucLuongRepository apiRepository =
    DanhSachMucLuongRepository();

    on<DanhSachMucLuongEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
        await apiRepository.getDanhSachMucLuong(event.request);
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