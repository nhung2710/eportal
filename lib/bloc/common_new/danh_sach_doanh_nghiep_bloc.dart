//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/danh_sach_doanh_nghiep_event.dart';
import '../../repository/common_new/danh_sach_doanh_nghiep_repository.dart';
import '../../state/base/base_state.dart';

class DanhSachDoanhNghiepBloc extends Bloc<BaseEvent, BaseState> {
  DanhSachDoanhNghiepBloc() : super(BaseInitial()) {
    final DanhSachDoanhNghiepRepository apiRepository =
    DanhSachDoanhNghiepRepository();

    on<DanhSachDoanhNghiepEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
        await apiRepository.getDanhSachDoanhNghiep(event.request);
        emit(BaseLoaded(response));
        if (response.status != 2) {
          emit(BaseError(response.message));
        }
      } on Exception
      catch (e) {
        emit(BaseError(e.toString()));
      }
      catch (error) {

      }
    });
  }
}