import 'package:flutter/material.dart';

//
// Created by BlackRose on 07/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class SettingPageModel {
  IconData icon;
  String title;
  WidgetBuilder builder;

  SettingPageModel(
      {required this.icon, required this.title, required this.builder});
}
