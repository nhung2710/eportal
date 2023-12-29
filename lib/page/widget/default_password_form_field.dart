//
// Created by BlackRose on 29/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultPasswordFormField extends DefaultTextFormField{
  DefaultPasswordFormField(
      {super.key,
        super.required,
        super.icon,
        super.suffixIcon,
        super.labelText,
        super.helperText,
        super.hintText,
        super.maxLength,
        super.maxLines,
        super.minLines,
        super.inputFormatters,
        super.keyboardType,
        super.focusNode,
        super.validator,
        super.textAlignVertical,
        super.textInputAction,
        super.onFieldSubmitted,
        super.readOnly,
        super.controller});
  @override
  State<StatefulWidget> createState() => DefaultPasswordFormFieldState();
}
class DefaultPasswordFormFieldState extends DefaultTextFormFieldState{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscureText = true;
    suffixIcon = GestureDetector(
      onTap: () {
        obscureText = !obscureText;
        setState(() {

        });
      },
      child: const Icon(
        FontAwesomeIcons.eye,
        color: AppColor.colorOfIcon,
        size: AppSizeIcon.sizeOfNormal,
      ),
    );
  }
}
