//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/video_detail_event.dart';
import 'package:eportal/model/api/response/common_new/data/video_detail_data_response.dart';
import 'package:eportal/repository/common_new/video_detail_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoDetailBloc extends Bloc<BaseEvent, DataState<List<VideoDetailDataResponse>>> {
  VideoDetailBloc() : super(const DataState<List<VideoDetailDataResponse>>()) {
    final VideoDetailRepository apiRepository =
    VideoDetailRepository();

    on<VideoDetailEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response =
        await apiRepository.getVideoDetail(event.request);
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