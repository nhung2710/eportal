//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extension/string_extension.dart';


class DefaultSearchFormField extends DefaultTextFormField {
  DefaultSearchFormField(
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
  State<StatefulWidget> createState() => DefaultSearchFormFieldState();
}

class DefaultSearchFormFieldState extends DefaultTextFormFieldState {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    suffixIcon = getCurrentSuffixIcon();
  }
  @override
  void focusNodeEvent() {
  }

  Widget getCurrentSuffixIcon() => GestureDetector(
    onTap: () => {
      if(widget.onFieldSubmitted!=null)
        widget.onFieldSubmitted!("")
    },
    child: const Icon(
      FontAwesomeIcons.magnifyingGlassPlus,
      color: AppColor.colorOfIcon,
      size: AppSizeIcon.sizeOfNormal,
    ),
  );

}
