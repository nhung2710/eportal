//
// Created by BlackRose on 21/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:flutter/foundation.dart';

class ErrorExtension {
  static final ErrorExtension _instance = ErrorExtension._internal();

  ErrorExtension._internal();

  factory ErrorExtension() {
    return _instance;
  }

  void handleActionError(void Function() function) {
    try {
      function();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  T? handleFunctionError<T>(T Function() function) {
    try {
      return function();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
