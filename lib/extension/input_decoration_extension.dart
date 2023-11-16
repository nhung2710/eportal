import 'package:flutter/material.dart';

import '../style/app_color.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
extension InputDecorationExtension on InputDecoration {
  InputDecoration defaultInputDecoration(
          {required String hintText, required IconData iconData}) =>
      InputDecoration(
        hintText: hintText,
        isDense: true,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 25,
          minHeight: 25,
        ),
        prefixIcon: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            iconData,
            color: AppColor.colorOfIcon,
            size: 20,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        counterText: "",
      );
}
