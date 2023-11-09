import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
abstract class  BaseState extends Equatable {

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