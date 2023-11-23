//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/faq_question_search_event.dart';
import 'package:eportal/repository/common_new/faq_question_search_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/api/response/common_new/data/faq_question_search_data_response.dart';

class FaqQuestionSearchBloc
    extends Bloc<BaseEvent, DataMoreState<FaqQuestionSearchDataResponse>> {
  FaqQuestionSearchBloc()
      : super(const DataMoreState<FaqQuestionSearchDataResponse>()) {
    final FaqQuestionSearchRepository apiRepository =
        FaqQuestionSearchRepository();

    on<FaqQuestionSearchEvent>((event, emit) async {
      try {
        if (state.hasReachedMax && event.request.obj.soTrangHienTai != 1)
          return;
        if (state.status == DataBlocStatus.init ||
            event.request.obj.soTrangHienTai == 1) {
          emit(state.copyWith(status: DataBlocStatus.loading));
        }
        final response =
            await apiRepository.getFaqQuestionSearch(event.request);
        if (event.request.obj.soTrangHienTai == 1) {
          emit(state.copyWith(
              data: response.data,
              hasReachedMax: response.data.isEmpty,
              status: response.data.isEmpty
                  ? DataBlocStatus.notfound
                  : DataBlocStatus.success));
        } else {
          emit(state.copyWith(
              data: state.data..addAll(response.data),
              hasReachedMax:
                  response.data.length < event.request.obj.soBanGhiTrenTrang,
              status: DataBlocStatus.success));
        }
      } on Exception catch (e) {
        emit(state.copyWith(
            errorMessage: e.toString(),
            status: DataBlocStatus.success,
            hasReachedMax: true));
      }
    });
  }
}
