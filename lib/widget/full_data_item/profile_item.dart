import 'package:eportal/widget/full_data_item/full_data_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileItem extends StatelessWidget {
  final bool isShowFull;
  final GestureTapCallback? onTap;
  final String? title;
  final String? industry;
  final String? experience;
  final String? salary;
  final String? fromDate;
  final String? toDate;
  final String? status;
  final String? location;
  final String? numberView;

  ProfileItem({
    this.onTap,
    this.isShowFull = false,
    this.title,
    this.industry,
    this.experience,
    this.salary,
    this.fromDate,
    this.toDate,
    this.status,
    this.location,
    this.numberView,
  });

  @override
  Widget build(BuildContext context) => FullDataItem(
        onTap: onTap,
        isShowFull: isShowFull,
        dataItems: [
          DataItem(text: title, icon: FontAwesomeIcons.tags, isShowFull: true),
          DataItem(
              text: industry,
              icon: FontAwesomeIcons.briefcase,
              isShowFull: true),
          DataItem(
              text: experience,
              icon: FontAwesomeIcons.rankingStar,
              isShowFull: true),
          DataItem(
              text: salary, icon: FontAwesomeIcons.moneyBill, isShowFull: true),
          DataItem(
              text: "$fromDate - $toDate",
              icon: FontAwesomeIcons.solidCalendarDays,
              isShowFull: true),
          DataItem(
              text: status,
              icon: FontAwesomeIcons.checkDouble,
              isShowFull: true),
          DataItem(
              text: location,
              icon: FontAwesomeIcons.locationDot,
              isShowFull: true),
          DataItem(
              text: "$numberView đã xem",
              icon: FontAwesomeIcons.solidEye,
              isShowFull: true),
        ],
      );
}
