import 'package:eportal/enum/data_bloc_status.dart';
import 'package:equatable/equatable.dart';

import '../../constant/application_constant.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DataSingleState<T> extends Equatable {
  final DataBlocStatus status;
  final T? data;
  final String errorMessage;

  const DataSingleState(
      {this.status = DataBlocStatus.init,
      this.data,
      this.errorMessage = ApplicationConstant.EMPTY});

  DataSingleState<T> copyWith({
    DataBlocStatus? status,
    T? data,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return DataSingleState<T>(
        status: status ?? this.status,
        data: data ?? this.data,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [data, status, errorMessage];
}

class DataMultiState<T> extends Equatable {
  final DataBlocStatus status;
  final List<T> data;
  final String errorMessage;

  const DataMultiState(
      {this.status = DataBlocStatus.init,
      this.data = const [],
      this.errorMessage = ApplicationConstant.EMPTY});

  DataMultiState<T> copyWith({
    DataBlocStatus? status,
    List<T>? data,
    String? errorMessage,
  }) {
    return DataMultiState<T>(
        status: status ?? this.status,
        data: data ?? this.data,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [data, status, errorMessage];
}

class DataPageState<T> extends Equatable {
  final DataBlocStatus status;
  final List<T> data;
  final String errorMessage;
  final bool hasReachedMax;
  final int numberData;

  const DataPageState(
      {this.status = DataBlocStatus.init,
      this.data = const [],
      this.numberData = 0,
      this.hasReachedMax = false,
      this.errorMessage = ApplicationConstant.EMPTY});

  DataPageState<T> copyWith({
    DataBlocStatus? status,
    List<T>? data,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return DataPageState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      numberData: (data ?? this.data).length,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [data, status, errorMessage, hasReachedMax, numberData];
}
