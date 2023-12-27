//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:flutter/material.dart';

import 'base_page_state.dart';

abstract class BaseFragmentState<T extends StatefulWidget>
    extends BasePageState<T> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: pageUI(context),
      ),
    );
  }
}