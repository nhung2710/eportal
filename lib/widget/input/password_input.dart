import 'package:flutter/material.dart';

import '../../style/app_color.dart';
import '../../style/app_size_icon.dart';

//
// Created by BlackRose on 17/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class PasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  bool obscureText;
  final int? maxLength;

  PasswordInput(
      {super.key,
      this.controller,
      this.onFieldSubmitted,
      this.validator,
      this.hintText,
      this.textInputAction,
      this.maxLength = 50,
      this.obscureText = true});

  @override
  State<StatefulWidget> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: widget.hintText,
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.colorOfIcon, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: const Icon(
              Icons.lock,
              color: AppColor.colorOfIcon,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                widget.obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColor.colorOfIcon,
                size: AppSizeIcon.sizeOfNormal,
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
}
