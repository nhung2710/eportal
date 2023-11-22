import 'package:equatable/equatable.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

class BaseInitial extends BaseState {}

class BaseLoading extends BaseState {}

class BaseLoaded<T> extends BaseState {
  final T data;

  const BaseLoaded(this.data);
}

class BaseError extends BaseState {
  final String? message;

  const BaseError(this.message);
}

enum DataStatus { loading, success }

class BaseLoadMore<T> extends BaseState {
  final DataStatus status;
  final List<T> data;
  final bool hasReachedMax;
  final int numberData;

  const BaseLoadMore(
      {this.status = DataStatus.loading,
      this.hasReachedMax = false,
      this.numberData = 0,
      this.data = const []});

  BaseLoadMore<T> copyWith({
    DataStatus? status,
    List<T>? data,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return BaseLoadMore<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      numberData: (data ?? this.data).length,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [status, data, hasReachedMax, numberData];
}
