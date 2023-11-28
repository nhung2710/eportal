import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/full_data_item/full_data_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 28/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class CurriculumVitaeItem extends StatelessWidget {
  final bool isShowFull;
  final GestureTapCallback? onTap;
  final String? title;
  final String? education;
  final String? careerGoals;
  final String? skillsForte;
  final String? workExperience;

  CurriculumVitaeItem({
    this.onTap,
    this.isShowFull = false,
    this.title,
    this.education,
    this.careerGoals,
    this.skillsForte,
    this.workExperience,
  });

  @override
  Widget build(BuildContext context) => FullDataItem(
        onTap: onTap,
        isShowFull: isShowFull,
        dataItems: [
          DataItem(text: title, icon: FontAwesomeIcons.tags, isShowFull: true),
          DataItem(
              text: education,
              icon: FontAwesomeIcons.graduationCap,
              isShowFull: true),
          DataItem(
              text: careerGoals,
              icon: FontAwesomeIcons.clockRotateLeft,
              isShowFull: true),
          DataItem(
              text: skillsForte,
              icon: FontAwesomeIcons.globe,
              isShowFull: true),
          DataItem(
              text: workExperience,
              icon: FontAwesomeIcons.bullseye,
              isShowFull: true,
              fontSize: 16,
              color: AppColor.colorOfIcon),
        ],
      );
}
