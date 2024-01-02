//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/page/base/page_state/base_fragment_state.dart';
import 'package:flutter/material.dart';

abstract class BaseFragmentKeepState <T extends StatefulWidget> extends BaseFragmentState<T> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: pageUI(context),
      ),
    );
  }
}