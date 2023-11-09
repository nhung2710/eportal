import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
abstract class BaseEvent<T extends BaseEportalRequest> extends Equatable {
  final T request;
  const BaseEvent({required this.request});

  @override
  List<Object> get props => [];
}