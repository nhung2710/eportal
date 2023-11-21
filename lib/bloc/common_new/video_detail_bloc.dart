//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/video_detail_event.dart';
import 'package:eportal/repository/common_new/video_detail_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoDetailBloc extends Bloc<BaseEvent, BaseState> {
  VideoDetailBloc() : super(BaseInitial()) {
    final VideoDetailRepository apiRepository = VideoDetailRepository();

    on<VideoDetailEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response = await apiRepository.getVideoDetail(event.request);
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
