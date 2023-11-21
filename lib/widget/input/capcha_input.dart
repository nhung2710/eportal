import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extension/color_extension.dart';
import '../../extension/string_extension.dart';
import '../../style/app_color.dart';
import '../../style/app_text_style.dart';

//
// Created by BlackRose on 17/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class CapchaInput extends StatefulWidget {
  TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final IconData? icon;
  final int maxLength;

  CapchaInput({
    super.key,
    this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.hintText,
    this.icon,
    this.maxLength = 6,
    this.textInputAction,
  });

  @override
  State<StatefulWidget> createState() => _CapchaInputState();
}

class _CapchaInputState extends State<CapchaInput> {
  String code = "";
  int numberReload = 0;
  var colors = [];
  var fontSizes = [];

  @override
  void initState() {
    widget.controller = widget.controller ?? TextEditingController();
    _newText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: false,
        controller: widget.controller,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,
        inputFormatters: [UpperCaseTextFormatter()],
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Mã xác nhận không được để trống';
          }
          if (text != code) {
            numberReload++;
            if (numberReload >= 1) _newText();
            return 'Mã xác nhận không hợp lệ';
          }
          return null;
        },
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: "Mã xác thực",
          isDense: true,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              widget.icon ?? Icons.lock_clock,
              color: AppColor.colorOfIcon,
              size: 20,
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 20,
          ),
          suffixIcon: GestureDetector(
            onTap: () => _newText(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    children: List.generate(
                        code.length,
                        (index) => TextSpan(
                            text: "\t${code[index]}\t",
                            style: AppTextStyle.titlePage.copyWith(
                                color: colors[index],
                                fontSize: fontSizes[index])))),
              ),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          counterText: "",
        ),
      );

  void _newText() {
    Random random = Random();
    numberReload = 0;
    widget.controller?.clear();
    code = "".randomString(widget.maxLength).toUpperCase();
    colors = List.generate(code.length, (index) => getRandomColor());
    fontSizes = List.generate(
        code.length,
        (index) =>
            (random.nextInt(5) + 16 + random.nextInt(index + 1)).toDouble());
    setState(() {});
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
