//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/video_list_event.dart';
import 'package:eportal/repository/common_new/video_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoListBloc extends Bloc<BaseEvent, BaseState> {
  VideoListBloc() : super(BaseInitial()) {
    final VideoListRepository apiRepository = VideoListRepository();

    on<VideoListEvent>((event, emit) async {
      try {
        emit(BaseLoading());
        final response = await apiRepository.getVideoList(event.request);
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
