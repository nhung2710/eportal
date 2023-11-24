import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:equatable/equatable.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
abstract class BaseSingleEvent<T extends BaseEportalRequest> extends Equatable {
  final T request;

  const BaseSingleEvent({required this.request});

  @override
  List<Object> get props => [];
}

abstract class BaseMultiEvent<T extends BaseEportalRequest> extends Equatable {
  final T request;

  const BaseMultiEvent({required this.request});

  @override
  List<Object> get props => [];
}

abstract class BasePageEvent<T extends BasePageEportalRequest>
    extends Equatable {
  final T request;

  const BasePageEvent({required this.request});

  @override
  List<Object> get props => [];
}
