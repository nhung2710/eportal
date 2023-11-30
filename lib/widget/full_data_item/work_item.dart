import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/full_data_item/full_data_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 28/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class WorkItem extends StatelessWidget {
  final bool isShowFull;
  final GestureTapCallback? onTap;
  final String? title;
  final String? description;
  final String? ages;
  final String? workTime;
  final String? benefit;
  final String? tenTinhTP;
  final String? soNamKinhNghiem;
  final String? hanNopHoSo;
  final String? requirementsProfile;
  final String? contactUser;
  final String? contactAddress;
  final String? requirement;

  WorkItem({
    this.onTap,
    this.isShowFull = false,
    this.title,
    this.description,
    this.ages,
    this.workTime,
    this.benefit,
    this.tenTinhTP,
    this.soNamKinhNghiem,
    this.hanNopHoSo,
    this.requirementsProfile,
    this.contactUser,
    this.contactAddress,
    this.requirement,
  });

  @override
  Widget build(BuildContext context) => FullDataItem(
        onTap: onTap,
        isShowFull: isShowFull,
        dataItems: [
          DataItem(text: title, icon: FontAwesomeIcons.tags, isShowFull: true),
          DataItem(
              text: description,
              icon: FontAwesomeIcons.briefcase,
              isShowFull: true),
          DataItem(text: ages, icon: FontAwesomeIcons.rankingStar),
          DataItem(
            text: workTime,
            icon: FontAwesomeIcons.businessTime,
          ),
          DataItem(
              text: benefit,
              icon: FontAwesomeIcons.thumbsUp,
              fontSize: 16,
              color: AppColor.colorOfIcon),
          DataItem(
              text: requirement,
              icon: FontAwesomeIcons.idCard,
              fontSize: 16,
              color: Colors.red),
          DataItem(
            text: requirementsProfile,
            icon: FontAwesomeIcons.folderPlus,
          ),
          DataItem(
            text: contactUser,
            icon: FontAwesomeIcons.addressBook,
          ),
          DataItem(
            text: contactAddress,
            icon: FontAwesomeIcons.locationDot,
          ),
          DataItem(
              text: tenTinhTP,
              icon: FontAwesomeIcons.locationDot,
              isShowFull: true),
          DataItem(
              text: soNamKinhNghiem,
              icon: FontAwesomeIcons.bookmark,
              isShowFull: true),
          DataItem(
              text: hanNopHoSo,
              icon: FontAwesomeIcons.calendar,
              isShowFull: true),
        ],
      );
}
