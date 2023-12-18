//
// Created by BlackRose on 18/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';

class ChooseActionDialogItem {
  String title;
  VoidCallback clickAction;
  bool result;

  ChooseActionDialogItem(
      {required this.title, required this.clickAction, required this.result});
}

class ChooseActionDialog extends StatelessWidget {
  String title;
  List<ChooseActionDialogItem> items = [];

  ChooseActionDialog({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    children.add(Text(
      title,
      style: AppTextStyle.titlePage.copyWith(color: AppColor.colorOfIcon),
    ));
    for (var i = 0; i < items.length; i++) {
      children.add(const SizedBox(
        height: 20,
      ));
      children.add(DefaultButton(
        onPressed: () {
          Navigator.of(context).pop(items.elementAt(i).result);
          items.elementAt(i).clickAction();
        },
        text: items.elementAt(i).title,
      ));
    }
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
