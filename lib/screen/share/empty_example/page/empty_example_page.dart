import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/video/eportal_video_widget.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class EmptyExamplePage extends BasePage {
  bool isHasAppBar;

  EmptyExamplePage({super.key, this.isHasAppBar = false});

  @override
  State<StatefulWidget> createState() => _EmptyExamplePageState();
}

class _EmptyExamplePageState extends BasePageState<EmptyExamplePage> {
  @override
  bool isHasAppBar(BuildContext context) => widget.isHasAppBar;

  @override
  String getPageTitle(BuildContext context) => "Đang phát triển";

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => buildImplement(context);
}
