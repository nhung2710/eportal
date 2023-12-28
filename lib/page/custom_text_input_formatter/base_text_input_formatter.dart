//
// Created by BlackRose on 12/28/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:flutter/services.dart';

abstract class BaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return formatTextEditingValue(
        oldValue, newValue, newValue.text.length < oldValue.text.length);
  }

  TextEditingValue formatTextEditingValue(
      TextEditingValue oldValue, TextEditingValue newValue, bool isClear);
}
