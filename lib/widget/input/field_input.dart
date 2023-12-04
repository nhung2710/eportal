import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../style/app_color.dart';
import '../../style/app_size_icon.dart';

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
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  FocusNode? focusNode;

  FieldInput({
    super.key,
    this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.hintText,
    this.icon,
    this.focusNode,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.maxLength = 50,
    this.inputFormatters,
    this.textInputAction,
  });

  @override
  State<StatefulWidget> createState() => _FieldInputState();
}

class _FieldInputState extends State<FieldInput> {
  bool isShowIcon = false;

  @override
  void initState() {
    isShowIcon = widget.focusNode?.hasFocus ?? false;
    widget.controller = widget.controller ?? TextEditingController();
    if (widget.focusNode == null) {
      widget.focusNode = widget.focusNode ?? FocusNode();
      widget.focusNode?.addListener(() {
        setState(() {
          isShowIcon = widget.focusNode?.hasFocus ?? false;
        });
      });
    } else {
      isShowIcon = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: false,
        controller: widget.controller,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        focusNode: widget.focusNode,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        style: AppTextStyle.title,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: widget.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.colorOfIcon, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
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
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
          suffixIcon: isShowIcon
              ? GestureDetector(
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
                      size: AppSizeIcon.sizeOfNormal,
                    ),
                  ),
                )
              : const SizedBox(
                  width: 25,
                  height: 25,
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
