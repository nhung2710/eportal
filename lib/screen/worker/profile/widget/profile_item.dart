//
// Created by BlackRose on 18/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/full_data_item/full_data_item.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileItem extends StatelessWidget {
  final GestureTapCallback onTapProfileEdit;
  final GestureTapCallback onTapReferEdit;
  final JobUserListByUserNameDataResponse data;

  ProfileItem({
    required this.onTapProfileEdit,
    required this.onTapReferEdit,
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
                  text: data.education,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.graduationCap,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: data.careerGoals,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.clockRotateLeft,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: data.skillsForte,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.globe,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: data.workExperience,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.bullseye,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: DefaultButton(
                    onPressed: onTapProfileEdit,
                    text: "Sửa",
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: DefaultButton(
                    onPressed: onTapReferEdit,
                    text: "Người tham khảo",
                  ),
                )
              ]),
        ),
      );
}
