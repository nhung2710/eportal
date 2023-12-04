import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ListOfJobAppliedPage extends BasePage {
  const ListOfJobAppliedPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfJobAppliedPageState();
}

class _ListOfJobAppliedPageState
    extends BasePageStateActive<ListOfJobAppliedPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => buildScreenLoading(context);
}
