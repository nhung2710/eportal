import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class EmptyExamplePage extends BasePage{
  const EmptyExamplePage({super.key});


  @override
  State<StatefulWidget> createState() => _EmptyExamplePageState();
}

class _EmptyExamplePageState extends BasePageStateActive<EmptyExamplePage>{

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  double currentPadding(BuildContext context)  => 0;
  @override
  Widget pageUI(BuildContext context) => Container(
  );


}