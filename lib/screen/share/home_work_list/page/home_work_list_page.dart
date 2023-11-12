import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorkListPage extends BasePage {
  const HomeWorkListPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeWorkListPageState();
}

class _HomeWorkListPageState extends BasePageStateActive<HomeWorkListPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => Container();
}
