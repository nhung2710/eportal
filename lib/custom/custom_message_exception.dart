import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CustomMessageException implements  Exception {
  String message;
  CustomMessageException(this.message);
}