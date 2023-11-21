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

class InfoButton extends StatelessWidget {
  String? text;
  IconData? icon;
  final GestureTapCallback? onTap;

  InfoButton({super.key, this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: AppElevation.sizeOfNormal,
          color: AppColor.colorOfApp,
          shadowColor: AppColor.colorOfIcon,
          borderOnForeground: true,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: AppColor.colorOfDrawer, width: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
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
                        top: 5.0, bottom: 5, right: 30, left: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        text.supportHtml(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.title
                            .copyWith(color: AppColor.colorOfIcon),
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ) // text
              ],
            ),
          ),
        ),
      );
}
