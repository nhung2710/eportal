//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class DefaultLabelItem extends StatelessWidget{
  final String? title;
  final IconData icon;
  const DefaultLabelItem({super.key,required this.title, required this.icon});


  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
          color: AppColor.colorOfIcon,
          size: AppSizeIcon.sizeOfNormal,),
        Expanded(child:
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(title.supportHtml(),textAlign: TextAlign.start,style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),)
        )
        ),
      ],
    ),
  );

}