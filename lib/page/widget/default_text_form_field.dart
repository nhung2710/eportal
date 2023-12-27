//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/app_text_style.dart';

class DefaultTextFormField extends StatefulWidget{
  final IconData? icon;
  final IconData? suffixIcon;

  DefaultTextFormField({super.key,this.icon,this.suffixIcon});
  @override
  State<StatefulWidget> createState() => DefaultTextFormFieldState();
}

class DefaultTextFormFieldState extends State<DefaultTextFormField>{
  @override
  Widget build(BuildContext context)=> TextFormField(
    initialValue: 'Input text',
    maxLength: 20,
    decoration: InputDecoration(
      icon: Icon(widget.icon,
        color: AppColor.colorOfIcon,
        size: AppSizeIcon.sizeOfNormal,),
      labelText: 'Label text',
      alignLabelWithHint: true,
      labelStyle: AppTextStyle.normal.copyWith(
        color: AppColor.colorOfIconActive,
      ),
      helperText: 'Helper text',
      suffixIcon: Icon(
        Icons.check_circle,
        color: AppColor.colorOfIcon,
        size: AppSizeIcon.sizeOfNormal,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.colorOfIconActive,width: 1),
      ),
      border:UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.colorOfIcon,width: 1),
      ),
    ),
  );
}