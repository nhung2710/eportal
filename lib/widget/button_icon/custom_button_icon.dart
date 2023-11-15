import 'package:flutter/material.dart';

import '../../style/app_color.dart';
import '../../style/app_text_style.dart';

//
// Created by BlackRose on 15/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CustomButtonIcon extends StatelessWidget {
  Size? size;
  GestureTapCallback? onTap;
  IconData? iconData;
  String? title;

  CustomButtonIcon({
    super.key,
    this.size,
    this.onTap,
    this.iconData,
    this.title,
  });

  @override
  Widget build(BuildContext context) => SizedBox.fromSize(
        size: size ?? const Size(65, 65), // button width and height
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColor.colorOfHintText, width: 0.5),
            color: AppColor.colorOfApp,
          ),
          child: InkWell(
            splashColor: AppColor.colorOfApp, // splash color
            onTap: onTap, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Icon(
                    iconData ?? Icons.call,
                    color: AppColor.colorOfIcon,
                  ),
                ), // icon
                Expanded(
                  flex: 1,
                  child: Text(
                    title ?? "Call",
                    style: AppTextStyle.normalChild1
                        .copyWith(color: AppColor.colorOfIcon),
                    maxLines: 2,
                  ),
                ) // text
              ],
            ),
          ),
        ),
      );
}
