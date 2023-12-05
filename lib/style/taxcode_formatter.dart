import 'dart:math';

import 'package:flutter/services.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class TaxCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var value = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    var prefixTxt = value.substring(0, min(value.length, 10));
    var suffixTxt = "";
    String newText = prefixTxt;
    if (value.length > 10) {
      suffixTxt = value.substring(10, 10 + min(value.length - 10, 3));
      newText += "-$suffixTxt";
    }

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
