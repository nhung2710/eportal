//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/ten_tinh_tp_event.dart';
import '../../repository/common_new/ten_tinh_tp_repository.dart';
import '../../state/base/base_state.dart';

class TenTinhTpBloc extends Bloc<BaseEvent, BaseState> {
  TenTinhTpBloc() : super(BaseInitial()) {
    final TenTinhTpRepository apiRepository =
    TenTinhTpRepository();

    on<TenTinhTpEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response =
        await apiRepository.getTenTinhTp(event.request);
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