import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/gioi_thieu_trung_tam/gioi_thieu_trung_tam_event.dart';
import 'package:eportal/repository/common_new/gioi_thieu_trung_tam/gioi_thieu_trung_tam_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GioiThieuTrungTamBloc extends Bloc<BaseEvent, BaseState> {

  GioiThieuTrungTamBloc() : super(BaseInitial()){
    final GioiThieuTrungTamRepository apiRepository = GioiThieuTrungTamRepository();

    on<GioiThieuTrungTamEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response = await apiRepository.getGioiThieuTrungTam(event.request);
        emit(BaseLoaded(response));
        if (response.status != 2) {
          emit(BaseError(response.message));
        }
      } on Exception catch(e) {
        emit(BaseError(e.toString()));
      }
    });
  }

}