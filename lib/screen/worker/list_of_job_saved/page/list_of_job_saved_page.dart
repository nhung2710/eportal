import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ListOfJobSavedPage extends BasePage {
  const ListOfJobSavedPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfJobSavedPageState();
}

class _ListOfJobSavedPageState extends BasePageStateActive<ListOfJobSavedPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => buildNotFoundData(context);
}
