//
// Created by BlackRose on 12/20/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobAdvertisementItem extends StatelessWidget {
  final GestureTapCallback onTapEdit;
  final GestureTapCallback onTapDelete;
  final WorkSearchByUserNameDataResponse data;

  JobAdvertisementItem({
    required this.onTapEdit,
    required this.onTapDelete,
    required this.data,
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
                  text: data.title,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.tags,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: data.description,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.briefcase,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: data.workTime,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.businessTime,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: data.benefit,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.thumbsUp,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: data.soNamKinhNghiem,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.bookmark,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: data.hanNopHoSo,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.calendar,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
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
