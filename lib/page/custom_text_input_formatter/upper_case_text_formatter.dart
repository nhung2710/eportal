//
// Created by BlackRose on 12/28/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/page/custom_text_input_formatter/base_text_input_formatter.dart';
import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends BaseTextInputFormatter {
  @override
  TextEditingValue formatTextEditingValue(
      TextEditingValue oldValue, TextEditingValue newValue, bool isClear) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
