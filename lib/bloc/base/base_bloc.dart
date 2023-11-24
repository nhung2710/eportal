import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/faq_question_search_event.dart';
import 'package:eportal/model/api/response/common_new/data/album_detail_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:eportal/model/base/base_eportal_response.dart';
import 'package:eportal/repository/common_new/faq_question_search_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 24/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

abstract class BaseSingleBloc<T, R, E extends BaseSingleEvent,
        RP extends BaseSingleEportalResponse>
    extends Bloc<BaseSingleEvent, DataSingleState<T>> {
  BaseSingleBloc() : super(DataSingleState<T>()) {
    final R apiRepository = getRepository();

    on<E>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response = await callApiResult(apiRepository, event);
        if (response.status != 2) {
          emit(state.copyWith(
              errorMessage: response.message, status: DataBlocStatus.error));
        } else {
          String? failMessage = getFailMessage(response);
          if (failMessage.isNullOrWhiteSpace()) {
            emit(state.copyWith(
                data: response.data, status: DataBlocStatus.success));
          } else {
            emit(state.copyWith(
                errorMessage: failMessage, status: DataBlocStatus.error));
          }
        }
      } on Exception catch (e) {
        emit(state.copyWith(
            errorMessage: e.toString(), status: DataBlocStatus.error));
      }
    });
  }

  @protected
  R getRepository();

  @protected
  Future<RP> callApiResult(R apiRepository, E event);

  @protected
  String? getFailMessage(RP response);

  String getMessageError(String? message) =>
      message.replaceWhenNullOrWhiteSpace(ApplicationConstant.SYSTEM_ERROR);
}

abstract class BaseMultiBloc<T extends BaseEportalDataResponse, R,
        E extends BaseMultiEvent, RP extends BaseMultiEportalResponse<T>>
    extends Bloc<BaseMultiEvent, DataMultiState<T>> {
  BaseMultiBloc() : super(DataMultiState<T>()) {
    final R apiRepository = getRepository();

    on<E>((event, emit) async {
      try {
        emit(state.copyWith(status: DataBlocStatus.loading));
        final response = await callApiResult(apiRepository, event);
        if (response.status != 2) {
          emit(state.copyWith(
              errorMessage: response.message, status: DataBlocStatus.error));
        } else {
          String? failMessage = getFailMessage(response);
          if (failMessage.isNullOrWhiteSpace()) {
            if (response.data.isEmpty) {
              emit(state.copyWith(status: DataBlocStatus.notfound));
            } else {
              emit(state.copyWith(
                  data: response.data, status: DataBlocStatus.success));
            }
          } else {
            emit(state.copyWith(
                errorMessage: failMessage, status: DataBlocStatus.error));
          }
        }
      } on Exception catch (e) {
        emit(state.copyWith(
            errorMessage: e.toString(), status: DataBlocStatus.error));
      }
    });
  }

  @protected
  R getRepository();

  @protected
  Future<RP> callApiResult(R apiRepository, E event);

  @protected
  String? getFailMessage(RP response);

  String getMessageError(String? message) =>
      message.replaceWhenNullOrWhiteSpace(ApplicationConstant.SYSTEM_ERROR);
}

abstract class BasePageBloc<T extends BaseEportalDataResponse, R,
        E extends BasePageEvent, RP extends BasePageEportalResponse<T>>
    extends Bloc<BasePageEvent, DataPageState<T>> {
  BasePageBloc() : super(DataPageState<T>()) {
    final R apiRepository = getRepository();

    on<E>((event, emit) async {
      try {
        if (state.hasReachedMax && event.request.obj.soTrangHienTai != 1) {
          return;
        }
        bool isFirstPage = state.status == DataBlocStatus.init ||
            event.request.obj.soTrangHienTai == 1;
        if (isFirstPage) {
          emit(state.copyWith(status: DataBlocStatus.loading));
        }
        final response = await callApiResult(apiRepository, event);
        var responseData = response.data ?? [];
        bool hasReachedMax = checkHasReachedMax(responseData, event);
        if (isFirstPage) {
          emit(state.copyWith(
              data: responseData,
              hasReachedMax: hasReachedMax,
              status: responseData.isEmpty
                  ? DataBlocStatus.notfound
                  : DataBlocStatus.success));
        } else {
          emit(state.copyWith(
              data: state.data..addAll(response.data),
              hasReachedMax: hasReachedMax,
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

  R getRepository();

  Future<RP> callApiResult(R apiRepository, E event);

  String? getFailMessage(RP response);

  String getMessageError(String? message) =>
      message.replaceWhenNullOrWhiteSpace(ApplicationConstant.SYSTEM_ERROR);

  bool checkHasReachedMax(List<T> responseData, E event) =>
      responseData.length < event.request.obj.soBanGhiTrenTrang;
}
