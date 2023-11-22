//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/video_list_event.dart';
import 'package:eportal/repository/common_new/video_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/api/response/common_new/data/video_list_data_response.dart';


class VideoListBloc extends Bloc<BaseEvent, DataMoreState<VideoListDataResponse>> {
  VideoListBloc()
      : super(const DataMoreState<VideoListDataResponse>()) {
    final VideoListRepository apiRepository =
    VideoListRepository();

    on<VideoListEvent>((event, emit) async {
      try {
        if(state.hasReachedMax)return;
        if(state.status == DataBlocStatus.init || event.request.obj.soTrangHienTai == 1) {
          emit(state.copyWith(status: DataBlocStatus.loading));
        }
        final response =
        await apiRepository.getVideoList(event.request);
        if (event.request.obj.soTrangHienTai == 1) {
          emit(state.copyWith(
              data: response.data,
              hasReachedMax: response.data.isEmpty,
              status: response.data.isEmpty ? DataBlocStatus.notfound: DataBlocStatus.success));
        }
        else{
          emit(state.copyWith(
              data: state.data..addAll(response.data),
              hasReachedMax: response.data.isEmpty,
              status: DataBlocStatus.success));
        }
      } on Exception catch (e) {
        emit(state.copyWith(errorMessage: e.toString(),status: DataBlocStatus.success,hasReachedMax: true));
      }
    });
  }
}