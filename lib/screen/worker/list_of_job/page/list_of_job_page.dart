import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ListOfJobPage extends BasePage {
  const ListOfJobPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfJobPageState();
}

class _ListOfJobPageState extends BasePageStateActive<ListOfJobPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => buildImplement(context);
}
