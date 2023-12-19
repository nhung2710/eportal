//
// Created by BlackRose on 19/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';
import '../../style/app_color.dart';

class CustomCheckbox extends StatefulWidget {
  bool? check;
  String? title;
  ValueChanged<bool?>? onChanged;
  CustomCheckbox({super.key,this.check = false,this.title = "",this.onChanged});

  @override
  State<StatefulWidget> createState() => CustomCheckboxState();
}


class CustomCheckboxState extends State<CustomCheckbox>{


  @override
  Widget build(BuildContext context) => Row(
    children: [
      Checkbox(
        isError: true,
        value: widget.check,
        activeColor: AppColor.colorOfIcon,
        side: const BorderSide(color: AppColor.colorOfIcon,width: 2),
        onChanged: (bool? value) {
          setState(() {
            widget.check = value;
          });
          if(widget.onChanged!=null) {
            widget.onChanged!(value);
          }
        },
      ),
      Expanded(child: Text(
        widget.title.supportHtml(),
        style: AppTextStyle.title,
      ))
    ],
  );
}