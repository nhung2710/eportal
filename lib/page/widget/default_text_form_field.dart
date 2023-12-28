//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../style/app_text_style.dart';

class DefaultTextFormField extends StatefulWidget {
  final IconData? icon;
  final IconData? suffixIcon;
  final String? labelText;
  final String? helperText;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final bool readOnly;
  TextEditingController? controller;
  FocusNode? focusNode;
  TextAlignVertical? textAlignVertical;

  DefaultTextFormField(
      {super.key,
      this.icon,
      this.suffixIcon,
      this.labelText,
      this.helperText,
      this.hintText,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.inputFormatters,
      this.keyboardType,
      this.focusNode,
      this.validator,
      this.textAlignVertical,
      this.textInputAction,
      this.onFieldSubmitted,
      this.readOnly = false,
      this.controller});

  @override
  State<StatefulWidget> createState() => DefaultTextFormFieldState();
}

class DefaultTextFormFieldState extends State<DefaultTextFormField> {
  Widget? suffixIcon;
  Widget? preSuffixIcon;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.suffixIcon == FontAwesomeIcons.deleteLeft) {
      suffixIcon = GestureDetector(
        onTap: () {
          widget.controller?.clear();
          widget.focusNode?.unfocus();
        },
        child: const Icon(
          FontAwesomeIcons.deleteLeft,
          color: Colors.red,
          size: AppSizeIcon.sizeOfNormal,
        ),
      );
    } else {
      suffixIcon = Icon(
        widget.suffixIcon,
        color: AppColor.colorOfIcon,
        size: AppSizeIcon.sizeOfNormal,
      );
    }
    widget.controller = widget.controller ?? TextEditingController();
    widget.focusNode = widget.focusNode ?? FocusNode();
    widget.focusNode?.addListener(focusNodeEvent);
    super.initState();
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(focusNodeEvent);
    super.dispose();
  }

  void focusNodeEvent() {
    bool isShowIcon = widget.focusNode?.hasFocus ?? false;
    if (isShowIcon) {
      preSuffixIcon = suffixIcon;
      suffixIcon = GestureDetector(
        onTap: () {
          widget.controller?.clear();
          widget.focusNode?.unfocus();
        },
        child: const Icon(
          FontAwesomeIcons.deleteLeft,
          color: Colors.red,
          size: AppSizeIcon.sizeOfNormal,
        ),
      );
    } else {
      suffixIcon = preSuffixIcon;
      preSuffixIcon = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        maxLength: widget.maxLength ?? 100,
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines ?? 1,
        readOnly: widget.readOnly,
        textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
        keyboardType: widget.keyboardType,
        onFieldSubmitted: widget.onFieldSubmitted,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        autovalidateMode: AutovalidateMode.always,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        style: AppTextStyle.title
            .copyWith(color: Colors.black, overflow: TextOverflow.visible),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          icon: Icon(
            widget.icon ?? Icons.tag,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          alignLabelWithHint: true,
          errorStyle: AppTextStyle.normal.copyWith(
            color: Colors.red,
          ),
          helperStyle: AppTextStyle.normal.copyWith(
            color: Colors.grey,
          ),
          labelStyle: AppTextStyle.normal.copyWith(
            color: AppColor.colorOfIcon,
          ),
          hintStyle: AppTextStyle.normal.copyWith(
            color: Colors.grey,
          ),
          counterStyle: AppTextStyle.normal.copyWith(
            color: Colors.red,
          ),
          suffixIcon: suffixIcon,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.3,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
            ),
          ),
        ),
      );
}
