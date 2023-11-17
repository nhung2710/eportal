import 'package:flutter/material.dart';

import '../../style/app_color.dart';

//
// Created by BlackRose on 17/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FieldInput extends StatefulWidget {
  TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final IconData? icon;
  final int? maxLength;
  final TextInputType? keyboardType;

  final FocusNode? focusNode;

  FieldInput({
    super.key,
    this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.hintText,
    this.icon,
    this.focusNode,
    this.keyboardType,
    this.maxLength = 50,
    this.textInputAction,
  });

  @override
  State<StatefulWidget> createState() => _FieldInputState();
}

class _FieldInputState extends State<FieldInput> {
  @override
  void initState() {
    widget.controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: false,
        controller: widget.controller,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: widget.hintText,
          isDense: true,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              widget.icon,
              color: AppColor.colorOfIcon,
              size: 20,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.controller?.clear();
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: const Icon(
                Icons.clear,
                color: AppColor.colorOfDrawer,
                size: 20,
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
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
