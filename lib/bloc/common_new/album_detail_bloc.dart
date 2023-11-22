import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/album_detail_event.dart';
import 'package:eportal/model/api/response/common_new/data/album_detail_data_response.dart';
import 'package:eportal/repository/common_new/album_detail_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class AlbumDetailBloc extends Bloc<BaseEvent, DataState<List<AlbumDetailDataResponse>>> {
  AlbumDetailBloc() : super(const DataState<List<AlbumDetailDataResponse>>()) {
    final AlbumDetailRepository apiRepository =
    AlbumDetailRepository();

    on<AlbumDetailEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getAlbumDetail(event.request);
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