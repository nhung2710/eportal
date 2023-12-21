//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//



import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../widget/default_button/default_button.dart';

class ChatBotManageItem extends StatelessWidget {
  final GestureTapCallback onTapEdit;
  final GestureTapCallback onTapDelete;

  ChatBotManageItem({
    required this.onTapEdit,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) => Card(
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
          children: [
            TextIcon(
              text: "1",
              overflow: TextOverflow.visible,
              icon: FontAwesomeIcons.tags,
              textStyle: AppTextStyle.title
                  .copyWith(color: Colors.black, fontSize: 12),
              isHasBorder: false,
            ),
            TextIcon(
              text: "1",
              overflow: TextOverflow.visible,
              icon: FontAwesomeIcons.briefcase,
              textStyle: AppTextStyle.title
                  .copyWith(color: Colors.black, fontSize: 12),
              isHasBorder: false,
            ),
            TextIcon(
              text: "1",
              overflow: TextOverflow.visible,
              icon: FontAwesomeIcons.businessTime,
              textStyle: AppTextStyle.title
                  .copyWith(color: Colors.black, fontSize: 12),
              isHasBorder: false,
            ),
            TextIcon(
              text: "1",
              overflow: TextOverflow.visible,
              icon: FontAwesomeIcons.thumbsUp,
              textStyle: AppTextStyle.title
                  .copyWith(color: Colors.black, fontSize: 12),
              isHasBorder: false,
            ),
            TextIcon(
              text: "1",
              overflow: TextOverflow.visible,
              icon: FontAwesomeIcons.bookmark,
              textStyle: AppTextStyle.title
                  .copyWith(color: Colors.black, fontSize: 12),
              isHasBorder: false,
            ),
            TextIcon(
              text: "1",
              overflow: TextOverflow.visible,
              icon: FontAwesomeIcons.calendar,
              textStyle: AppTextStyle.title
                  .copyWith(color: Colors.black, fontSize: 12),
              isHasBorder: false,
            ),
            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (BuildContext context, int index) {  },),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: DefaultButton(
                onPressed: onTapEdit,
                text: "Sửa",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: DefaultButton(
                onPressed: onTapDelete,
                backgroundColor: Colors.red,
                text: "Xoá",
              ),
            )
          ]),
    ),
  );
}