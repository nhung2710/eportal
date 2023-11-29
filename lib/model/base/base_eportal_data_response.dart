import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 24/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class BaseEportalDataResponse {
  String search = "";

  bool filter(String filter) {
    return filter.isNullOrWhiteSpace() ||
        search.contains(filter.getValueSearch());
  }
}
