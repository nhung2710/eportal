import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/show_full_info/show_full_info.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 28/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FullDataItem extends StatelessWidget {
  final bool isShowFull;
  final GestureTapCallback? onTap;
  List<DataItem> dataItems = [];

  FullDataItem(
      {this.isShowFull = false, this.onTap, this.dataItems = const []});

  @override
  Widget build(BuildContext context) {
    TextOverflow overflow =
        isShowFull ? TextOverflow.visible : TextOverflow.ellipsis;
    int? maxLines = isShowFull ? null : 2;
    List<Widget> widgets = [];
    widgets.addAll(dataItems
        .where(
            (element) => isShowFull == true || isShowFull != element.isShowFull)
        .map((e) => TextIcon(
              text: e.text,
              overflow: overflow,
              maxLines: maxLines,
              icon: e.icon,
              textStyle: AppTextStyle.title.copyWith(
                  color: e.color ?? Colors.black, fontSize: e.fontSize ?? 12),
              isHasBorder: false,
            )));
    if (!isShowFull) {
      widgets.add(ShowFullInfo(
        text: "Xem chi tiết",
      ));
    }
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: AppElevation.sizeOfNormal,
        color: AppColor.colorOfApp,
        shadowColor: AppColor.colorOfIcon,
        borderOnForeground: false,
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets),
        ),
      ),
    );
  }
}

class DataItem {
  final String? text;
  final bool isShowFull;
  final IconData? icon;
  final Color? color;
  final double? fontSize;

  DataItem(
      {this.text,
      this.icon,
      this.color,
      this.fontSize,
      this.isShowFull = false});
}
