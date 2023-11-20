import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../constant/application_constant.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

extension DateTimeExtension on DateTime {
  String toFormatDateTime({String format = "yyyy-MM-ddTHH:mm:ss"}) {
    return DateFormat(format).format(this);
  }
}
