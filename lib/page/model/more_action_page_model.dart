//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:flutter/material.dart';

class MoreActionPageModel {

  IconData icon;
  String title;
  GestureTapCallback? onTap;
  WidgetBuilder? builder;
  bool isHasRightIcon;
  void Function() function;

  MoreActionPageModel(
      {required this.icon,
        required this.title,
        required this.function,
        this.isHasRightIcon = true,
        this.onTap});
}