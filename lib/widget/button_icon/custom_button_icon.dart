import 'package:eportal/style/app_elevation.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';
import '../../style/app_color.dart';
import '../../style/app_text_style.dart';

//
// Created by BlackRose on 15/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CustomButtonIcon extends StatelessWidget {
  GestureTapCallback? onTap;
  IconData? iconData;
  String title;

  CustomButtonIcon({
    super.key,
    this.onTap,
    this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: AppElevation.sizeOfNormal,
          color: AppColor.colorOfApp,
          shadowColor: AppColor.colorOfIcon,
          borderOnForeground: false,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: AppColor.colorOfDrawer, width: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Icon(
                        iconData ?? Icons.call,
                        color: AppColor.colorOfIcon,
                      ),
                    ),
                  ),
                ), // icon
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    title.addLine(2),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.titleChild2
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
