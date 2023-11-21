import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/dang_ky_event.dart';
import 'package:eportal/repository/common_new/dang_ky_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangKyBloc extends Bloc<BaseEvent, BaseState> {
  DangKyBloc() : super(BaseInitial()) {
    final DangKyRepository apiRepository = DangKyRepository();

    on<DangKyEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response = await apiRepository.getDangKy(event.request);
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
