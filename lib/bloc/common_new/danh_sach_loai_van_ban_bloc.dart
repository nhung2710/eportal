import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/danh_sach_loai_van_ban_event.dart';
import 'package:eportal/repository/common_new/danh_sach_loai_van_ban_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachLoaiVanBanBloc extends Bloc<BaseEvent, BaseState> {
  DanhSachLoaiVanBanBloc() : super(BaseInitial()) {
    final DanhSachLoaiVanBanRepository apiRepository =
        DanhSachLoaiVanBanRepository();

    on<DanhSachLoaiVanBanEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
            await apiRepository.getDanhSachLoaiVanBan(event.request);
        emit(BaseLoaded(response));
        if (response.status != 2) {
          emit(BaseError(response.message));
        }
      } on Exception catch (e) {
        emit(BaseError(e.toString()));
      } catch (e) {
        emit(BaseError(e.toString()));
      }
    });
  }
}
