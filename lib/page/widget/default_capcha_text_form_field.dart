//
// Created by BlackRose on 12/28/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'dart:math';

import 'package:eportal/page/custom_text_input_formatter/upper_case_text_formatter.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extension/string_extension.dart';

class DefaultCapchaTextFormField extends StatefulWidget {
  TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextInputAction? textInputAction;
  final IconData? icon;
  final int maxLength;
  final TextAlignVertical? textAlignVertical;

  DefaultCapchaTextFormField({
    super.key,
    this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.maxLength = 6,
    this.textAlignVertical,
    this.textInputAction,
  });

  @override
  State<StatefulWidget> createState() => DefaultCapchaTextFormFieldState();
}

class DefaultCapchaTextFormFieldState
    extends State<DefaultCapchaTextFormField> {
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
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 5),
        child: TextFormField(
          obscureText: false,
          controller: widget.controller,
          maxLength: widget.maxLength,
          style: AppTextStyle.title.copyWith(
            color: AppColor.colorOfIcon,
            overflow: TextOverflow.visible,
            fontWeight: FontWeight.w900,
            letterSpacing: 10,
          ),
          textInputAction: widget.textInputAction,
          textAlignVertical:
              widget.textAlignVertical ?? TextAlignVertical.center,
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
            //_newText();
            return null;
          },
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            hintText: widget.hintText ?? "Mã xác thực",
            labelText: widget.labelText ?? "Mã xác thực",
            helperText: widget.helperText ?? "",
            isDense: true,
            alignLabelWithHint: true,
            errorStyle: AppTextStyle.normal.copyWith(
              color: Colors.red,
              letterSpacing: 1,
            ),
            helperStyle: AppTextStyle.normal.copyWith(
              color: Colors.grey,
              letterSpacing: 1,
            ),
            labelStyle: AppTextStyle.normal.copyWith(
              color: AppColor.colorOfIcon,
              letterSpacing: 1,
            ),
            hintStyle: AppTextStyle.normal.copyWith(
              color: Colors.grey,
              letterSpacing: 1,
            ),
            counterStyle: AppTextStyle.normal.copyWith(
              color: Colors.red,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.colorOfIcon,
                width: 0.3,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 0.3,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.colorOfIcon,
                width: 0.3,
              ),
            ),
            prefixIcon: Icon(
              widget.icon ?? FontAwesomeIcons.key,
              color: AppColor.colorOfIcon,
              size: AppSizeIcon.sizeOfNormal,
            ),
            suffixIcon: GestureDetector(
              onTap: () => _newText(),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    children: List.generate(
                        code.length,
                        (index) => TextSpan(
                            text: code[index],
                            style: AppTextStyle.titlePage.copyWith(
                                overflow: TextOverflow.visible,
                                color: colors[index],
                                fontWeight: FontWeight.w900,
                                letterSpacing: 10,
                                fontSize: fontSizes[index])))),
              ),
            ),
          ),
        ),
      );

  void _newText() {
    Random random = Random();
    widget.controller?.clear();
    numberReload = 0;
    widget.controller?.clear();
    code = "".randomString(widget.maxLength).toUpperCase();
    const lstColor = [
      Colors.black,
      Colors.red,
      Colors.blue,
      Colors.blueGrey,
      Colors.orange,
      Colors.indigo
    ];

    colors = List.generate(code.length,
        (index) => lstColor.elementAt(Random().nextInt(lstColor.length)));
    fontSizes = List.generate(
        code.length,
        (index) =>
            (random.nextInt(5) + 16 + random.nextInt(index + 1)).toDouble());

    widget.controller?.text = code;
    setState(() {});
  }
}
