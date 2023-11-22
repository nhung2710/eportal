import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class TextIcon extends StatelessWidget {
  IconData? icon;
  String? text;
  TextStyle? textStyle;
  int? maxLines;
  double padding;
  bool isHasBorder;

  TextIcon({
    super.key,
    this.icon,
    this.textStyle,
    this.text,
    this.isHasBorder = true,
    this.padding = 5,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) => isHasBorder
      ? Card(
          elevation: AppElevation.sizeOfNormal,
          color: AppColor.colorOfApp,
          shadowColor: AppColor.colorOfIcon,
          borderOnForeground: true,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: AppColor.colorOfDrawer, width: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: _buildItem(context),
        )
      : _buildItem(context);

  Widget _buildItem(BuildContext context) => Container(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  icon ?? Icons.email,
                  color: AppColor.colorOfIcon,
                  size: AppSizeIcon.sizeOfNormal,
                ),
              ),
            ), // icon
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5, right: 30, left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text.supportHtml(),
                    textAlign: TextAlign.left,
                    style: AppTextStyle.title
                        .copyWith(color: AppColor.colorOfIcon),
                    overflow: TextOverflow.fade,
                    maxLines: maxLines,
                  ),
                ),
              ),
            ) // text
          ],
        ),
      );
}
