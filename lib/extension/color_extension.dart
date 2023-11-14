import 'dart:math';

import 'package:flutter/material.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

getRandomColor() =>
    Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
